context('Test the countMissing function.')



test_that('countMissing counts and prints correct information.', {
  
  set.seed(2)

  A <- array(rnorm(10 * 20 * 3), dim = c(20, 3, 10))
  
  
  A[c(3, 4, 5), , 1] <- NA
  A[8, , 5] <- NA

  miss <- countMissing(A)

  expect_equal(miss, c(3, 0, 0, 0, 1, rep(0, 5)))
  
  expect_message(countMissing(A), '^2\ ')
  expect_message(countMissing(A), 'specimen 1 with 3 missing landmarks')


})

