context("Wrong argument type")

library(BiDimRegression)

test_that("Error is generated when arguments are of the wrong type", {
  expect_error(lm2(NakayaData))
  expect_error(lm2(A+B ~ C+D, 'affine', NakayaData))
  expect_error(lm2(A+B ~ C+D, 'affine', list(NakayaData)))
})

test_that("Error is generated when transformation is unknown", {
  expect_error(lm2(A+B ~ C+D, NakayaData, 'affina'))
  expect_error(lm2(A+B ~ C+D, NakayaData, '2d'))
  expect_error(lm2(A+B ~ C+D, NakayaData,  2))
})


test_that("Error is generated when data frame is empty", {
  expect_error(lm2(A+B ~ C+D, data.frame(), 'affine'))
})

test_that("Error is generated when variables are missing", {
  expect_error(lm2(A+B ~ C+D, NakayaData, 'affine'))
})

test_that("Error is generated when variables are of wrong type", {
  nakaya_temp <- NakayaData
  nakaya_temp$depV1 <- as.character(nakaya_temp$depV1)

  expect_error(lm2(depV1 + depV2 ~ indepV1 + indepV2, nakaya_temp, 'euclidean'))
})
