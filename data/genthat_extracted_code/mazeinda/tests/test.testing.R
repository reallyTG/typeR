library(mazeinda)
context("testing functions")


test_that("calc_p works", {
  x=abs(rnorm(10, 300,1))
  y=abs(rnorm(10, 300,1))
  expect_equal(calc_p(x,y), cor.test(x, y, method = "kendall")$p.value)
  x=c(0,0,0,1,1,0,1,0,0)
  y=c(1,9,2,3,4,5,0,0,9)
  p_11 <-prop_11(x,y)
  p_01 <-prop_01(x,y)
  p_10 <-prop_10(x,y)
  p_00 = 1 - (p_11 + p_01 + p_10)
  t_11 = 0
  tau_t = p_11^2 * t_11 + 2 * (p_00 * p_11 - p_01 * p_10)
  sigma = 2 * tau_t * (p_00 + p_11) - ((p_11^2) * t_11 * (2 * p_11 - (6 * p_00) - (4 * p_11 * t_11))) + 4 *
    p_01 * p_10 - (4 * tau_t^2)
  expect_equal(calc_p(x,y), pnorm(tau_t, mean = 0, sd = sqrt(sigma/length(x)), lower.tail = FALSE))
})
