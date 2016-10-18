class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================
#for character count without spaces
no_spaces_name=@text.gsub(/\s+/, "")

#For word count
text_lower=@text.downcase
splits=text_lower.split(" ")
wcount=splits.length.to_s



    @character_count_with_spaces = @text.length

    @character_count_without_spaces = no_spaces_name.length

    @word_count = wcount

    @occurrences = splits.count(@special_word.downcase)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = if (@apr/1200)==0
      @principal/@years
    else
      (((@apr/1200)*@principal)*((1+(@apr/1200))**(@years*12)))/(((1+(@apr/1200))**(@years*12))-1)
    end

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = (@ending-@starting)
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @weeks/52

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @sorted_numbers.last-@sorted_numbers.first

@half=@count/2
@half_int=@half.to_i

    @median = @sorted_numbers[@half_int]

    @sum = @numbers.sum

    @mean = @sum/@count

    @variance = "Replace this string with your answer."


    @standard_deviation = @sorted_numbers

    @most_popular_count = 0
      @sorted_numbers.each do |snum|
        if @sorted_numbers.count(snum) > @most_popular_count

          @most_popular_count = @sorted_numbers.count(snum)
          @most_popular = snum
        end
      end
    @mode = @most_popular
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
