context('Check variable transformation calculations')

test_that('transform_prm fails for inappropriate input', {
  expect_error(transform_prm(""))
  expect_error(transform_prm(~omega))
  expect_error(transform_prm(~omega, mu = c(omega = 1)))
  expect_error(transform_prm(~omega, mu = c(omega = 1), sigma = c(omega = 1), method = "test"))
  expect_error(transform_prm(~omega, mu = c(mu = 1), sigma = c(omega = 1)))
  expect_error(transform_prm(~omega, mu = c(omega = 1), sigma = c(mu = 1)))
})


test_that('delta method is exact for linear equation', {
  sigma <- matrix(c(2,0,0,2),2 ,2, byrow = T, dimnames = list(c("a", "b"), c("a", "b")))
  expect_equal(transform_prm(~a+b, mu = c(a = 1, b = 2), sigma = sigma, method = "delta"),
               list(mean = 3, variance = 4, rse = 2/3))
  sigma[1,2] <- sigma[2,1] <- 1
  expect_equal(transform_prm(~a+b, mu = c(a = 1, b = 2), sigma = sigma, method = "delta"),
               list(mean = 3, variance = 6, rse = sqrt(6)/3))
})

test_that('simulation method gives numerically identical results for linear equation', {
  set.seed(123)
  sigma <- matrix(c(2,0,0,2),2 ,2, byrow = T, dimnames = list(c("a", "b"), c("a", "b")))
  expect_equal(transform_prm(~a+b, mu = c(a = 1, b = 2), sigma = sigma, method = "mc", samples = 1E6),
               list(mean = 3, variance = 4, rse = 2/3), tolerance = 1E-3)
  sigma[1,2] <- sigma[2,1] <- 1
  expect_equal(transform_prm(~a+b, mu = c(a = 1, b = 2), sigma = sigma, method = "mc", samples = 1E6),
               list(mean = 3, variance = 6, rse = sqrt(6)/3), tolerance = 1E-3)
})

test_that('delta method works for non-linear function', {
  expect_equal(transform_prm(~sqrt(a), mu = c(a = 2), sigma = c(a = 4), method = "delta"),
               list(mean = sqrt(2), variance = 0.5, rse = 0.5))
})
