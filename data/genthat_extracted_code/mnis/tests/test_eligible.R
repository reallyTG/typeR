library(mnis)
context("mnis_eligible")


test_that("mnis_eligible returns expected format", {


  skip_on_cran()

  xmniselig <- mnis_eligible()
  expect_length(xmniselig, 23)
  expect_type(xmniselig, "list")
  expect_true(nrow(xmniselig)==1455)
  expect_true(tibble::is_tibble(xmniselig))


})
