context('functions')

test_that('qrandomunif', {
  tmp <- qrandomunif(10)
  expect_equal(length(tmp), 10)
  expect_success(expect_error(qrandomunif(n = "a"), "The number 'n' of random numbers to return has to be an integer."))
  expect_success(expect_error(qrandomunif(n = 2.5), "The number 'n' of random numbers to return has to be an integer."))
  expect_success(expect_error(qrandomunif(n = -3), "Random number requests must be between 1 and 100,000 numbers."))
  expect_success(expect_error(qrandomunif(n = 100001), "Random number requests must be between 1 and 100,000 numbers."))
  expect_success(expect_error(qrandomunif(a = "a"), "The parameters 'a' and 'b' must be numeric."))
  expect_success(expect_error(qrandomunif(b = "b"), "The parameters 'a' and 'b' must be numeric."))
  expect_success(expect_error(qrandomunif(a = 1, b = 0), "The minimum value 'a' of the distribution has to be less than parameter 'b'."))
  expect_gte(min(tmp), expected = 0)
  expect_lte(max(tmp), expected = 1)

  expect_equal(class(tmp), c("numeric"))
  expect_equal(dim(tmp), NULL)
  expect_equal(typeof(tmp), c("double"))
})
