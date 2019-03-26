library(PCRedux)

context("pcrfit_single")

test_that("pcrfit_single gives the correct dimensions and properties", {
  res_pcrfit_single <- pcrfit_single(RAS002[, 2])

  expect_that(res_pcrfit_single, is_a("data.frame"))
  expect_equal(res_pcrfit_single[["cp_e.agglo"]], 2)
  expect_length(res_pcrfit_single[["cp_bcp"]], 1)
  expect_that(round(res_pcrfit_single[["cpDdiff"]], 2) == 2.19, is_true())
  expect_equal(res_pcrfit_single[["top"]], 25)
  expect_equal(res_pcrfit_single[["bg.stop"]], 15)
  expect_equal(res_pcrfit_single[["amp.stop"]], 40)
  expect_that(res_pcrfit_single[["hookreg_hook"]] == 0, is_true())
  expect_that(res_pcrfit_single[["amptester_shapiro"]] == FALSE, is_true())
  expect_that(res_pcrfit_single[["amptester_lrt"]] == TRUE, is_true())
  expect_that(res_pcrfit_single[["amptester_rgt"]] == TRUE, is_true())
  expect_that(res_pcrfit_single[["amptester_tht"]] == TRUE, is_true())
  expect_that(res_pcrfit_single[["amptester_slt"]] == TRUE, is_true())
  expect_length(res_pcrfit_single, 49)
})
