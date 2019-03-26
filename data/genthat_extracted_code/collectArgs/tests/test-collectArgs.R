context("Checking collectArgs")

test_that("Args collected correctly", {
  main_function <- function(x, param_two, param_three, param_four) {
    sprintf("x has length %i. param_two has length %i. param_three has length %i. param_four has length %i.", 
        length(x), length(param_two), length(param_three), length(param_four)
    )
  }

  calling_func_1 <- function(x, param_two, param_three, param_four) {
    args <- collectArgs()
    do.call(main_function, args)  
  }

  calling_func_2_erorred <- function(x, param_two, param_three, param_four, param_five) {
    args <- collectArgs()
    do.call(main_function, args)
  }

  calling_func_2 <- function(x, param_two, param_three, param_four, param_five) {
    args <- collectArgs(except="param_five")
    do.call(main_function, args)
  }

  calling_func_3_errored <- function(x, param_two, param_four) {
    args <- collectArgs()
    do.call(main_function, args)
  }

  calling_func_3 <- function(x, param_two, param_four) {
    param_three <- "param described in function"
    args <- collectArgs()
    do.call(main_function, args)
  }

  output_expected <- "x has length 5. param_two has length 3. param_three has length 1. param_four has length 0."
  expect_equal(object=calling_func_1(1:5, c("a", "b", "c"), base::paste, as.integer()),  output_expected)

  expect_error(calling_func_2_erorred(1:5, c("a", "b", "c"), base::paste, as.integer(), param_five="some garbage"))
  expect_equal(calling_func_2(1:5, c("a", "b", "c"), base::paste, as.integer(), param_five="some garbage"), output_expected)

  expect_error(calling_func_3_erorred(1:5, c("a", "b", "c"), base::paste))
  expect_equal(calling_func_3(1:5, c("a", "b", "c"), as.integer()), output_expected)

})

## TODO:  More tests wiht parameters for collectArgs