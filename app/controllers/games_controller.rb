require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    until @letters.length == 10
      @letters << ('A'..'Z').to_a.sample
    end

  end

  def score
    url = open("https://wagon-dictionary.herokuapp.com/#{params[:input]}")
    json = JSON.parse(url.read)
    @found = json['found']

    @exits = true
    params[:input].split('').each do |letter|
      if params[:letters].include?(letter.upcase) && @exits
        @exits = true
      else
        @exits = false
      end
    end
  end
end
