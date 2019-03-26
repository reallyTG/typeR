library(PCRedux)

context("hookregNL")

test_that("hookregNL gives the correct dimensions and properties", {
  library(qpcR)
  res_hookregNL_positve <- hookregNL(x = boggy[, 1], y = boggy[, 2])
  res_hookregNL_positve_complex <- hookregNL(x = boggy[, 1], y = boggy[, 2], simple = FALSE)
  res_hookregNL_negative <- hookregNL(x = boggy[, 1], y = boggy[, 6])

  expect_that(res_hookregNL_positve, is_a("data.frame"))
  expect_that(round(res_hookregNL_positve[["slope"]], 8) == -0.01596799, is_true())
  expect_that(res_hookregNL_positve_complex, is_a("list"))
  expect_that(res_hookregNL_negative, is_a("data.frame"))
  expect_that(res_hookregNL_positve[["hook"]] == 1, is_true())
  expect_that(res_hookregNL_positve_complex[["hook"]] == 1, is_true())
  expect_that(res_hookregNL_positve_complex[["fit"]][["weights"]][1] == 1, is_true())
  expect_that(round(res_hookregNL_positve_complex[["slope"]], 8) == -0.01596799, is_true())
  expect_that(res_hookregNL_negative[["hook"]] == 1, is_false())
})
