library(PCRedux)

context("qPCR2fdata")

test_that("qPCR2fdata gives the correct dimensions and properties", {
  library(qpcR)
  res_fdata <- qPCR2fdata(testdat)
  res_fdata_preprocess <- qPCR2fdata(testdat, preprocess = TRUE)

  expect_that(res_fdata, is_a("fdata"))
  expect_that(length(res_fdata$rangeval) == 2 && res_fdata$rangeval[2] == 49, is_true())

  expect_that(res_fdata_preprocess, is_a("fdata"))
  expect_that(length(res_fdata_preprocess$rangeval) == 2 && res_fdata_preprocess$rangeval[2] == 49, is_true())
})
