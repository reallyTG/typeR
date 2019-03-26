library(mnis)
context("mnis_joined_between")


test_that("mnis_joined_between returns expected format", {

  skip_on_cran()

  xmjb <- mnis_joined_between(start_date = '2015-01-01', end_date ='2017-01-01', party='labour',tidy=TRUE)
  expect_length(xmjb, 23)
  expect_type(xmjb, "list")
  expect_true(tibble::is_tibble(xmjb))
  expect_true(nrow(xmjb)==64)

})

