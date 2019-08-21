# player thinks of a number and the game tries to guess the number based on follow up input
# guess between low and high number -> guess the middle
# tell user the guess
# if user says 'yes' -> game over
# if user says 'bigger' -> biggerFn(low, high)
# if smaller -> smallerFn(low, high)
# anything else -> ask user for a valid response
defmodule GuessingGame do
  def guess(a, b) when a > b do
    guess(b, a)
  end

  def guess(low, high) do
    answer = IO.gets("Hmm... Maybe you're thinking of #{mid(low, high)}?\n")

    case String.trim(answer) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "I knew it!"

      _ ->
        IO.puts(~s(Enter "bigger", "smaller", or "yes"))
        guess(low, high)
    end
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
