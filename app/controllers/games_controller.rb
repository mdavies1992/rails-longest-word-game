require "json"
require "open-uri"

class GamesController < ApplicationController
  def score
    @found = english_word
    @user_input = params[:input].downcase.chars
    @input_length = params[:input].length
    @letters = params[:generated].downcase.chars
    @valid = valid_check
  end

  def new
    @alphabet = ("a".."z").to_a
    @letters = []
    10.times {@letters << @alphabet.sample}
  end

  private

  def english_word
    url = "https://wagon-dictionary.herokuapp.com/#{params[:input]}"
    dictionary = URI.open(url).read
    word = JSON.parse(dictionary)
    return word['found']
  end

  def valid_check
    @user_input.each do |letter|
      return false unless @letters.delete(letter)
    end
    true
 end







end
