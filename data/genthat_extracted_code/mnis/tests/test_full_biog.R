library(mnis)
context("full_biog")


test_that("mnis_full_biog returns expected format", {

  skip_on_cran()

  xfb <- mnis_full_biog(172)
  expect_true(tibble::is_tibble(xfb))
  expect_length(xfb, 393)
  expect_type(xfb, "list")
  expect_true(nrow(xfb)==1)


})

