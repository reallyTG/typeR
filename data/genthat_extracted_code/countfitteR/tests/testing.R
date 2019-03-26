context("testing")
library(countfitteR)

test_that("fit_counts", {
  df <- data.frame(x1 = c(0,1,0,0,0,2), x2 = c(0,0,1,1,0,1))
  fc <- fit_counts(df, model = "pois") 
  
  expect_equal(df[1,1], 0)
  expect_equal(df[2,2], 0)
  expect_equal(df[6,1], 2)
  expect_equal(df[6,2], 1)
  expect_equal(df[5,5], NULL)
  expect_equal(fc$x1pois$BIC, 13.33694, tolerance = 3.09e-06)
  expect_equal(fc$x1pois$model, "pois")
  expect_equal(fc$x2pois$BIC, 11.95064, tolerance = 2.55e-06)
})

test_that("compare_fit", {
  df <- data.frame(x1 = c(0,1,0,0,0,2), x2 = c(0,0,1,1,0,1))
  cmp <- compare_fit(df, fitlist = fit_counts(df, model = "all"))
  
  expect_equal(df[1,1], 0)
  expect_equal(df[2,2], 0)
  expect_equal(df[6,1], 2)
  expect_equal(df[6,2], 1)
  expect_equal(df[5,5], NULL)
  expect_equal(cmp[1,5], 3.639184)
  # expect_equal(cmp[6,5], NA)
  expect_equal(cmp[18,5], 1.819557, tolerance = 3.65e-07)
})

test_that("plot_fit", {
  df <- data.frame(x1 = c(0,1,0,0,0,2), x2 = c(0,0,1,1,0,1))
  cmp <- compare_fit(df, fitlist = fit_counts(df, model = "all"))
  p <- plot_fitcmp(cmp)
  
  expect_equal(df[1,1], 0)
  expect_equal(df[2,2], 0)
  expect_equal(df[6,1], 2)
  expect_equal(df[6,2], 1)
  expect_equal(df[5,5], NULL)
  expect_equal(cmp[1,5], 3.639184)
  # expect_equal(cmp[6,5], NA)
  expect_equal(cmp[18,5], 1.819557, tolerance = 3.65e-07)
  expect_equal(p$labels[[1]], "x")
  expect_equal(p$coordinates$clip, "on")
  expect_equal(p$coordinates$limits$x, NULL)
})


test_that("summary_fit", {
  df <- data.frame(x1 = c(0,1,0,0,0,2), x2 = c(0,0,1,1,0,1))
  fc <- fit_counts(df, model = "all")
  sf <- summary_fitlist(fc) 
  
  expect_equal(df[1,1], 0)
  expect_equal(df[2,2], 0)
  expect_equal(df[6,1], 2)
  expect_equal(df[6,2], 1)
  expect_equal(df[5,5], NULL)
  expect_equal(fc$x1_pois$BIC, 13.33694, tolerance = 3.09e-06)
  # expect_equal(fc$x1_zip$BIC, NA)
  expect_equal(fc$x2_nb$BIC, 13.74248, tolerance = 2.8e-07)
  expect_equal(sf$BIC[1], 13.33694, tolerance = 3.09e-06)
  expect_equal(sf$theta[6], 19305.4, tolerance = 0.000684)
  expect_equal(sf$lambda[5], 0.5)
})