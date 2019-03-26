library(PCRedux)

context("mblrr")

test_that("mblrr gives the correct dimensions and properties", {
  library(qpcR)
  res <- mblrr(x = boggy[, 1], y = boggy[, 2], normalize = TRUE)

  expect_that(res, is_a("numeric"))
  expect_that(length(res) == 6, is_true())
  expect_that(is.na(res[["mblrr_cor_pt"]]) == 0, is_true())
  expect_that(res[["mblrr_cor_bg"]] >= 0.80067 && res[["mblrr_cor_bg"]] <= 0.800679, is_true())
  expect_that(res[["mblrr_cor_bg"]] >= 0.80067 && res[["mblrr_cor_bg"]] <= 0.800679, is_true())
  expect_that(round(res[["mblrr_intercept_pt"]], 6) == 1.037105, is_true())
  expect_that(round(res[["mblrr_slope_pt"]], 6) == -0.001629, is_true())
})
