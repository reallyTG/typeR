library(mnis)
context("mnis_extra")


test_that("mnis_extra returns expected format", {

  skip_on_cran()

  xmnise <- mnis_extra(4019)
  expect_length(xmnise, 188)
  expect_type(xmnise, "list")
  expect_true(nrow(xmnise)==1)
  expect_true(tibble::is_tibble(xmnise))

})
