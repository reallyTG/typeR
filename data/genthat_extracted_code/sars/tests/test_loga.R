context("sar_loga")
library(sars)

test_that("sar_loga returns correct results", {
  fit <- sar_loga(galap)
  expect_equal(round(fit$AICc, 2), 143.78)
  expect_equal(as.vector(round(fit$par[2], 2)), 30.28)
  expect_is(fit, "sars")
  expect_match(fit$normaTest[[1]], "lillie")
  expect_error(sar_linear(5), "data must be a matrix or dataframe")
})


test_that("sar_loga summary returns correct results", {
  fit <- sar_loga(galap)
  fs <- summary(fit)
  expect_equal(sum(fs$residuals), 6.439294e-15)
  expect_output(str(fs), "List of 16")
  expect_is(fs, "summary.sars")
  expect_equal(round(fs$normaTest[[2]]$p.value, 3), 0.658)
})
