context("Predictions consistency")

library(BiDimRegression)

test_that("Fitted (lm) and predicted (transformation matrix) values match", {
  lm2euc <- lm2(depV1 + depV2 ~ indepV1 + indepV2, NakayaData, 'euclidean')
  expect_lt(mean(as.matrix(lm2euc$fitted_values-predict(lm2euc, NakayaData[, 3:4]) )), .Machine$double.eps * 3)

  lm2aff <- lm2(depV1 + depV2 ~ indepV1 + indepV2, NakayaData, 'affine')
  expect_lt(mean(as.matrix(lm2aff$fitted_values-predict(lm2aff, NakayaData[, 3:4]) )), .Machine$double.eps * 3)
})
