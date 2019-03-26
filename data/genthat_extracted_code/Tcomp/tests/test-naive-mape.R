check_naive_mape <- function(cond1){
  
  the_data <- subset(tourism, cond1)
  n <- length(the_data)
  measures <- numeric(n)
  
  for(i in 1:n){
    the_series <- the_data[[i]]
    fc <- snaive(the_series$x, h = the_series$h)
    measures[i] <- accuracy(fc, the_series$xx)["Test set", "MAPE"]
  }
  
  return(round(mean(measures), 2))
}

expect_equal(check_naive_mape("monthly"), 22.56)
expect_equal(check_naive_mape("quarterly"), 16.46)
expect_equal(check_naive_mape("yearly"), 23.61)

