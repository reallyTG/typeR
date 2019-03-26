
set.seed(124356)

m <- 10
P <- matrix(rexp(m^2), m)
P <- P/rowSums(P)
z <- rmarkov(1e4, P)

test_that("'transitions' works", {
  expect_silent(t1 <- transitions(z))
  expect_is(t1, "matrix")
  expect_true(all(dim(t1) == c(m, m)))

  # given labels
  expect_error(transitions(z, labels = 1:2))
  expect_silent(t2 <- transitions(z, labels = 1:(m+1)))
  expect_true(all(dim(t2) == c(m + 1, m + 1)))

  expect_silent(t.order2 <- transitions(z, order = 2))
  expect_is(t.order2, "array")
  expect_true(all(dim(t.order2) == c(m, m, m)))

  # multiple sequences / MCMC chains
  zmat <- matrix(z, ncol = 2)
  expect_silent(t.mat <- transitions(zmat))
  expect_is(t.mat, "matrix")
  expect_true(all(dim(t.mat) == c(m, m)))
  expect_equal(t.mat, transitions(zmat[,1]) + transitions(zmat[,2]))
})

