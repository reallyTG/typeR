
set.seed(342)
a <- rexp(10, .1)
M <- 3000

test_that("Dirichlet random generation and fitting works", {

  expect_error(rdirichlet(-10, a))
  expect_error(rdirichlet(10, -a))

  expect_silent(rd <- rdirichlet(M, a))
  expect_is(rd, "matrix")
  expect_true(all(dim(rd) == c(M, length(a))))
  expect_true(all(rd >= 0))

  expect_silent(est <- fit_dirichlet(rd, abstol = .001))
  expect_length(est$alpha, length(a))
  expect_equal(est$alpha, a, tol = .1)
  expect_equal(est$sum, sum(a), tol = .1)

})
