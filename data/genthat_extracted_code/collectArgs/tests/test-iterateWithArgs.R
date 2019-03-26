context("Checking iterateWithArgs")

test_that("Args collected correctly", {
  test_func <- function(x, second_arg=1:5, third_arg=NULL, fourth_arg=c("hello world")) {
    cat("test_func_executed\n")

    dont_use_me_when_iterating <- "I should not have been used"
    # i_will_cause_failure <- "jkhjkhkjh"

    if (is.list(x)) {
      return(iterateWithArgs(x, FUNC=test_func, except="dont_use_me_when_iterating"))
    }

  return(x^2)
  }

  ## vectors
  expect_equal(test_func(1:4), c(1, 4, 9, 16))
  expect_output(test_func(1:4), "test_func_executed")

  ## list
  expect_equal(test_func(as.list(1:4)), list(1, 4, 9, 16))
  expect_output(test_func(as.list(1:4)), c("test_func_executed\ntest_func_executed\ntest_func_executed\ntest_func_executed\ntest_func_executed"))
})

test_that("Error Thrown Correctly", {
  test_func_will_error_only_on_list <- function(x, second_arg=1:5, third_arg=NULL, fourth_arg=c("hello world")) {
    cat("test_func_executed\n")

    dont_use_me_when_iterating <- "I should not have been used"
    i_will_cause_failure <- "jkhjkhkjh"

    if (is.list(x)) {
      return(iterateWithArgs(x, FUNC=test_func, except="dont_use_me_when_iterating"))
    }

  return(x^2)
  }

  ## vectors
  expect_equal(test_func_will_error_only_on_list(1:4), c(1, 4, 9, 16))
  expect_output(test_func_will_error_only_on_list(1:4), "test_func_executed")

  ## list
  expect_error(test_func_will_error_only_on_list(as.list(1:4)))
})

test_that("iterateWithArgs auto-identifies FUNC", {
  test_func2 <- function(x, ...) {
    if (is.list(x)) {
      return(iterateWithArgs(x, except="dont_use_me_when_iterating"))
    }

    return(x ^ 3)
  }

  wrapper_func <- function(x) {
    test_func2(x)
  }

  expect_equal(wrapper_func(1:4), c(1, 8, 27, 64))
  expect_silent(wrapper_func(1:4))

  expect_equal(wrapper_func(as.list(1:4)), list(1, 8, 27, 64))
  expect_message(wrapper_func(as.list(1:4)), "using 'test_func2' in iterateWithArgs\\(\\) -- note it's safer to add  FUNC='test_func2' in your call.\\n")
})
