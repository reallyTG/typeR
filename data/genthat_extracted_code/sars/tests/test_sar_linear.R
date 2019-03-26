context("sar_linear")

test_that("sar_linear returns correct results", {
  fit <- sar_linear(galap)
  expect_equal(round(fit$AICc, 2), 148.36)
  expect_equal(as.vector(round(fit$par[2], 2)), 0.19)
  expect_is(fit, "sars")
  expect_match(fit$normaTest[[1]], "lillie")
  expect_error(sar_linear(5), "data must be a matrix or dataframe")
})


test_that("sar_linear summary returns correct results", {
  fit <- sar_linear(galap)
  fs <- summary(fit)
  expect_equal(sum(fs$residuals), 0.2)
  expect_output(str(fs), "List of 16")
  expect_is(fs, "summary.sars")
  expect_equal(round(fs$normaTest[[2]]$p.value, 3), 0.047)
})
