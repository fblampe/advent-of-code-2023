lines = File.read!("input")
  |> String.split


# Part 1

part1 = Enum.reduce(lines, 0, fn line, sum ->
  [_, first] = Regex.run(~r/^.*?(\d).*$/, line)
  [_, last] = Regex.run(~r/^.*(\d).*?$/, line)
  sum + String.to_integer(first <> last)
end)

IO.puts("Part 1: #{part1}")


# Part 2

digits_for_words = %{
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
}

part2 = Enum.reduce(lines, 0, fn line, sum ->
  [_, first] = Regex.run(~r/^.*?(\d|one|two|three|four|five|six|seven|eight|nine).*$/, line)
  [_, last] = Regex.run(~r/^.*(\d|one|two|three|four|five|six|seven|eight|nine).*?$/, line)

  first_as_digit_string = Map.get(digits_for_words, first, first)
  last_as_digit_string = Map.get(digits_for_words, last, last)

  sum + String.to_integer(first_as_digit_string <> last_as_digit_string)
end)

IO.puts("Part 2: #{part2}")
