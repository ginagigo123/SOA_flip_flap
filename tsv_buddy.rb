# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.split("\t") }
    header = rows[0]
    @data = rows[1..-1].map do |line|
      line.map.with_index { |value, index| [header[index], value] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header = "#{@data[0].keys.join("\t")}\n"
    rows = @data.map do |row|
      row.values.join("\t")
    end

    "#{header}#{rows.join("\n")}\n"
  end
end
