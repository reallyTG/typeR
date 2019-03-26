library(nima)
context("Checking whether ggplot objects produce appropriate output in layers")

test_that("qqPlots_gg produces expected layers in a standard run", {
  expect_equal(
    compFun(
      c(5, 8, 9, NA, 3, NA), c(5, 2, 9, 4, NA, NA)
    ),
    c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
  )
})

test_that("lmPlots_gg produces expected layers in a standard Gaussian lm()", {
  expect_equal(
    sum(compFun(
      matrix(rnorm(1000), ncol = 20),
      matrix(rbinom(1000, 1, 0.6), ncol = 20)
    )),
    0
  )
})

test_that("survPlot_gg produces expected layers with a basic Kaplan-Meier", {
  expect_equal(
    compFun(
      as.list(c(1, 2, 3, 4, 5, NA)),
      as.list(c(1, NA, 2, 3, 5, 4))
    ),
    as.list(c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE))
  )
})
