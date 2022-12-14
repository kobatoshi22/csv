defmodule CsvModule do
  def read_csv(csv_file) do
    File.read!(csv_file)
  end

  def processing_csv(data) do

    [field_name | value] = String.split(data, "\r\n")

    field = String.split(field_name, ",")
    value = Enum.map(value, &String.split(&1, ","))
    |> Enum.map(&Enum.into(Enum.zip(field, &1), %{}))
  end
end


defmodule Main do
  def main() do
    CsvModule.read_csv("CUSTOMER.csv")
    |> CsvModule.processing_csv()

  end
end
