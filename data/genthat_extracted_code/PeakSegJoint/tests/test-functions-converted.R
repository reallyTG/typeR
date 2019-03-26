context("ConvertModelList")

data(H3K4me3.TDH.other.chunk8)
fit <- PeakSegJointHeuristic(H3K4me3.TDH.other.chunk8, 3)

test_that("segments for model with 0 peaks", {
  converted <- ConvertModelList(fit)
  expect_true(0 %in% converted$segments$peaks)
  expect_equal(9:0, converted$modelSelection$peaks)
})

fit$models[[11]]$loss <- fit$models[[10]]$loss
fit$models[[9]]$loss <- fit$models[[8]]$loss

test_that("converted contains modelSelection", {
  converted <- ConvertModelList(fit)
  expect_equal(c(10, 8, 6:0), converted$modelSelection$peaks)
})
