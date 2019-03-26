context("Plotting")

test_that("getPlotData", {
  fit <- readRDS("testdata/test_fit.rds")
  expect_is(fit, "TemporalIso")
  
  x <- getPlotData(fit, prop = 0.5, time = 1:6)
  expect_is(fit, "TemporalIso")
  expect_equal(dim(x), c(6, 4))
  expect_equal(colnames(x), c("lower", "median", "upper", "time"))
  expect_equal(
    x$upper,
    as.vector(rstan::summary(fit)$summary[paste0("interval[", 1:6, "]"), "75%"]),
    info = summary(fit)
  )
  expect_equal(
    x$lower,
    as.vector(rstan::summary(fit)$summary[paste0("interval[", 1:6, "]"), "25%"])
  )
  expect_equal(
    x$median,
    as.vector(rstan::summary(fit)$summary[paste0("interval[", 1:6, "]"), "50%"])
  )
  
})
