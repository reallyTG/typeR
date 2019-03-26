context("stouffer's method for z-score")

test_that("z-score testing results are as expected via stouffer's method", {
  z = 2.5
  expect_lt(stouffer_z(rep(z, 5)), stouffer_z(rep(z, 10)))
  expect_lt(stouffer_z(rep(z, 5)), stouffer_z(rep(z+1, 5)))
  expect_equal(pnorm(abs(stouffer_z(rep(z, 5)))), pnorm(abs(stouffer_z(rep(-z, 5)))))
})
