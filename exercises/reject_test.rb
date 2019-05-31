# frozen_string_literal: true

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class RejectTest < Minitest::Test

  def test_remove_zeros
    numbers = [2, 93, 7, 0, 0, 1, 0, 31, 0, 368]
    filtered = numbers.reject(&:zero?)
    assert_equal [2, 93, 7, 1, 31, 368], filtered
  end

  def test_remove_vowels
    letters = ['a', 'l', 'l', ' ', 'y', 'o', 'u', 'r', ' ', 'b', 'a', 's', 'e', ' ', 'a', 'r', 'e', ' ', 'b', 'e', 'l', 'o', 'n', 'g', ' ', 't', 'o', ' ', 'u', 's']
    remaining = letters.reject do |letter|
      %w[a e i o u y].include? letter
    end
    assert_equal ['l', 'l', ' ', 'r', ' ', 'b', 's', ' ', 'r', ' ', 'b', 'l', 'n', 'g', ' ', 't', ' ', 's'], remaining
  end

  def test_remove_numbers_divisible_by_3
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    remaining = numbers.reject { |num| (num % 3).zero? }
    assert_equal [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20], remaining
  end

  def test_remove_words_with_more_than_three_letters
    words = %w[pill bad finger cat blue dog table red]
    selected = words.reject { |word| word.length > 3 }
    assert_equal %w[bad cat dog red], selected
  end

  def test_remove_words_ending_in_e
    words = %w[are you strike thinking belt piece warble sing pipe]
    selected = words.reject { |word| word.end_with? 'e' }
    assert_equal %w[you thinking belt sing], selected
  end

  def test_remove_words_ending_in_ing
    words = %w[bring finger drought singing bingo purposeful]
    selected = words.reject { |word| word.end_with? 'ing' }
    assert_equal %w[finger drought bingo purposeful], selected
  end

  def test_remove_words_containing_e
    words = %w[four red five blue pizza purple]
    selected = words.reject { |word| word.include? 'e' }
    assert_equal %w[four pizza], selected
  end

  def test_remove_dinosaurs
    animals = %w[tyrannosaurus narwhal eel achillesaurus qingxiusaurus]
    notasaurus = animals.reject { |animal| animal.include? 'saurus' }
    assert_equal %w[narwhal eel], notasaurus
  end

  def test_remove_numbers
    elements = ['cat', 'dog', 23, 81.1, 56, 'aimless', 43]
    not_numbers = elements.reject { |e| e.is_a? Numeric }
    assert_equal %w[cat dog aimless], not_numbers
  end

  def test_remove_floats
    elements = ['cat', 'dog', 32.333, 23, 56, 'aimless', 43.2]
    not_numbers = elements.reject { |e| e.is_a? Float }
    assert_equal ['cat', 'dog', 23, 56, 'aimless'], not_numbers
  end

  def test_remove_animals_starting_with_vowels
    animals = %w[aardvark bonobo cat dog elephant]
    remaining = animals.reject { |animal| animal.start_with?('a', 'e', 'i', 'o', 'u') }
    assert_equal %w[bonobo cat dog], remaining
  end

  def test_remove_capitalized_words
    words = %w[CAT dog AIMLESS Trevor butter]
    remaining = words.reject { |word| word == word.upcase }
    assert_equal %w[dog Trevor butter], remaining
  end

  def test_remove_arrays
    elements = ['CAT', ['dog'], 23, [56, 3, 8], 'AIMLESS', 43, 'butter']
    remaining = elements.reject { |e| e.is_a? Array }
    assert_equal ['CAT', 23, 'AIMLESS', 43, 'butter'], remaining
  end

  def test_remove_hashes
    elements = ['cat', {dog: 'fido'}, 23, {stuff: 'things'}, 'aimless', 43]
    remaining = elements.reject { |e| e.is_a? Hash }
    assert_equal ['cat', 23, 'aimless', 43], remaining
  end

end