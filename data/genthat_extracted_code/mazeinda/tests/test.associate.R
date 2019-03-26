library(mazeinda)
context("association functions")


test_that("tau_t works", {
  x=abs(rnorm(10, 300,1))
  y=abs(rnorm(10, 300,1))
  expect_equal(tau_p(x,y), cor(x, y, method = "kendall"))
  x=c(0,0,0,1,1,0,1,0,0)
  y=c(1,9,2,3,4,5,0,0,9)
  expect_equal(tau_p(x,y), 2*((prop_11(x,y) *(1-prop_11(x,y)-prop_10(x,y)-prop_01(x,y))) - (prop_10(x,y) * prop_01(x,y))))
  x=c(0,1,0,0,0,0,0,0,0)
  y=c(1,9,2,3,4,5,0,0,9)
  expect_equal(tau_p(x,y), cor(x, y, method = "kendall"))
  x=c(0,1,0,2,0,0,6,0,0,0)
  y=c(1,9,2,3,4,5,0,4,9,0)
  nz <- which(apply(cbind(x, y), 1, function(row) all(row[1] > 0 & row[2] > 0)))
  nz_data <- cbind(x, y)[nz, ]
  t_11 <- cor(nz_data[, 1], nz_data[, 2], method = "kendall")
  expect_equal(tau_p(x,y), prop_11(x,y)^2 * t_11 + 2*((prop_11(x,y) *(1-prop_11(x,y)-prop_10(x,y)-prop_01(x,y))) - (prop_10(x,y) * prop_01(x,y))))
})


