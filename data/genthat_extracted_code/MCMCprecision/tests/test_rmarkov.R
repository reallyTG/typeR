set.seed(124356)

m <- 5
N <- 1e4

test_that("'rmarkov' works", {
  P <- matrix(rexp(m^2), m)
  P <- P/rowSums(P)
  expect_silent(z <- rmarkov(N, P))
  expect_length(z, N)

  expect_silent(rmarkov(10, P * 2))  # automatically normalized
  expect_error(rmarkov(-1, P))
  expect_error(rmarkov(10, P, 1))
  expect_error(rmarkov(10, P, - rep(1, ncol(P))))
  expect_error(rmarkov(10, - P))

  # constant value:
  P <- diag(m)
  expect_silent(z <- rmarkov(N, P, start = c(1, rep(0, m-1))))
  expect_equal(z, rep(1, N))

})
