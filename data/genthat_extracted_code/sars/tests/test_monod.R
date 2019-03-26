context("sar_monod")

test_that("sar_monod returns correct results", {
  data(niering)
  fit <- sar_monod(niering)
  expect_equal(nrow(niering), 32)
  expect_equal(round(fit$AICc, 2), 113.37)
  expect_equal(as.vector(round(fit$par[2], 2)), 0.04)
  expect_is(fit, "sars")
  expect_match(fit$normaTest[[1]], "lillie")
  expect_error(sar_linear(5), "data must be a matrix or dataframe")
})


test_that("sar_monod summary returns correct results", {
  data(aegean)
  fit <- sar_monod(aegean)
  fs <- summary(fit)
  expect_equal(nrow(aegean), 90)
  expect_equal(sum(fs$residuals), -161.9)
  expect_output(str(fs), "List of 16")
  expect_is(fs, "summary.sars")
  expect_equal(round(fs$normaTest[[2]]$p.value, 3), 0.025)
})
