class ApplicationController < ActionController::Base
  def blank_square_form

    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    # params = {"elephant"=>"42"}

    @num = params.fetch("elephant").to_f

    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def random_form

    render({ :template => "calculation_templates/random_new.html.erb"})

  end

  def calculate_random

    @lower = params.fetch("minimum").to_f
    @upper = params.fetch("maximum").to_f
    @result = rand(@lower..@upper).to_f

    render({ :template => "calculation_templates/rand_results.html.erb"})
  end

  def calculate_square_root

    @num = params.fetch("number").to_f

   @square_root = @num ** 0.5
    render({ :template => "calculation_templates/square_roots_results.html.erb" })
  end

  def square_root_form

    render({ :template => "calculation_templates/square_roots_form.html.erb" })
  end

  def blank_payment_form

    render({ :template => "calculation_templates/payment_form.html.erb" })

    #@num = params.fetch("")
  end

  def payment_result

    @apr = params.fetch("dinero").to_f
    @num_of_years = params.fetch("dinero1").to_i
    @principal = params.fetch("abc").to_f

    r = @apr / 100 / 12
    num_payment_period = @num_of_years * 12
    @numerator = r * @principal
    @denominator = 1 - ((1 + r)**-num_payment_period) 
    @payment = @numerator / @denominator
    render ({ :template => "calculation_templates/payment_results.html.erb" })
    

  end
end
