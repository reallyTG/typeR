context('functions')

test_that('qrandomnorm', {
  tmp <- qrandomnorm(10)
  expect_equal(length(tmp), 10)
  expect_success(expect_error(qrandomnorm(n = "a"), "The number 'n' of random numbers to return has to be an integer."))
  expect_success(expect_error(qrandomnorm(n = 2.5), "The number 'n' of random numbers to return has to be an integer."))
  expect_success(expect_error(qrandomnorm(n = -3), "Random number requests must be between 1 and 100,000 numbers."))
  expect_success(expect_error(qrandomnorm(n = 100001), "Random number requests must be between 1 and 100,000 numbers."))
  expect_success(expect_error(qrandomnorm(method = "a"), "The method for generating true normal random variables has to be 'inverse', 'polar' or 'boxmuller'."))
  expect_success(expect_error(qrandomnorm(sd = -1), "The standard deviation 'sd' must not be negative."))

  expect_equal(class(tmp), c("numeric"))
  expect_equal(dim(tmp), NULL)
  expect_equal(typeof(tmp), c("double"))
})
