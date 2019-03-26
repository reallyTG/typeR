context("test testing extensions for testthat")

test_that("combinations of commutative arguments", {
  skip("needs rewrite for new testthat")
  # result has 'info' for the last test before returning.
  result <- expect_that_combine_all_args(sum(1, 2), testthat::equals(3))
  expect_true(result$passed)
  expect_that(result$error, testthat::not(testthat::is_true()))
  # this runs 7! = 5040 tests!
  result <- expect_that_combine_all_args(sum(1, 2, 3, 4, 5, 6, 7),
                                         testthat::equals(28))
  expect_true(result$passed)
  expect_that(result$error, testthat::not(testthat::is_true()))

  result <- expect_that_combine_first_arg(sum(c(1, 2)), testthat::equals(3))
  expect_true(result$passed)
  expect_that(result$error, testthat::not(testthat::is_true()))
  # this runs 7! = 5040 tests!
  result <- expect_that_combine_first_arg(sum(c(1, 2, 3, 4, 5, 6, 7)),
                                          testthat::equals(28))
  expect_true(result$passed)
  expect_that(result$error, testthat::not(testthat::is_true()))


})

test_that("throw error or warning for ?every iteration", {
  skip("needs rewrite for new testthat")
  result <- expect_that_combine_all_args(stop("a", "b"),
                                         testthat::throws_error())
  expect_true(result$passed)
  expect_that(result$error, testthat::not(testthat::is_true()))

  # each combo here should give NaN warning
  result <- expect_that_combine_first_arg(sqrt(c(-1, 0, 1)),
                                         testthat::gives_warning())
  expect_true(result$passed)
  expect_that(result$error, testthat::not(testthat::is_true()))

})

test_that("named arguments are permuted successfully", {
  res <- gsub(pattern = "the", replacement = "le", x = "Pierre the chat")
  expect_that_combine_all_args(
    gsub(pattern = "the", replacement = "le", x = "Pierre the chat"),
    testthat::equals(res)
  )
})
