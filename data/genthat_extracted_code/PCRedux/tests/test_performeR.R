library(PCRedux)

context("performeR")

test_that("performeR gives the correct dimensions and properties", {
  test_data <- c(0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1)
  reference_data <- c(0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1)
  res_performeR <- performeR(sample = test_data, reference = reference_data)

  expect_that(res_performeR, is_a("data.frame"))
  expect_that(res_performeR$TP == 10 && res_performeR$TP == 10 && res_performeR$SPC == 1, is_true())
})
