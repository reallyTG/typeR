context("Get")
test_that("get sotkanet includes year field",{
  skip_on_cran()
  expect_true("year" %in% names(GetDataSotkanet(indicators = 10013)))
})

