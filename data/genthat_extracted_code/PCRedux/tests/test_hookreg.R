library(PCRedux)

context("hookreg")

test_that("hookreg gives the correct dimensions and properties", {
  library(qpcR)
  res_hookreg_positve <- hookreg(x = boggy[, 1], y = boggy[, 2])
  res_hookreg_negative <- hookreg(x = boggy[, 1], y = boggy[, 6])

  expect_that(res_hookreg_positve, is_a("numeric"))
  expect_that(res_hookreg_negative, is_a("numeric"))
  expect_that(res_hookreg_positve[["hook"]] == 1, is_true())
  expect_that(res_hookreg_negative[["hook"]] == 1, is_false())
})
