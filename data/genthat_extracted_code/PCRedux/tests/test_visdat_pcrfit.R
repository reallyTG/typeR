library(PCRedux)

context("visdat_pcrfit")

test_that("visdat_pcrfit uses all types", {
  library(qpcR)
  test_data <- testdat[, c(1, 2, 4)]
  res_pcrfit <- cbind(runs = "F1.1", pcrfit_single(test_data[, 2]))

  plot_visdat_pcrfit <- visdat_pcrfit(res_pcrfit, type = "all", interactive = FALSE)

  expect_that(plot_visdat_pcrfit, is_a("gg"))
  expect_that(nrow(plot_visdat_pcrfit[["data"]]), equals(39))
})

test_that("visdat_pcrfit uses the qpcR package types only", {
  library(qpcR)
  test_data <- testdat[, c(1, 2, 4)]
  res_pcrfit <- cbind(runs = "F1.1", pcrfit_single(test_data[, 2]))

  plot_visdat_pcrfit <- visdat_pcrfit(res_pcrfit, type = "qpcR", interactive = FALSE)

  expect_that(plot_visdat_pcrfit, is_a("gg"))
  expect_that(nrow(plot_visdat_pcrfit[["data"]]), equals(11))
})
