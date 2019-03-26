context("Get Basic Report")

test_that("get_details runs successfully", {

  skip_on_cran()
  
  google_token <- readRDS("token_file.rds")
  options(google_token=google_token[[1]])

  get_info <- get_report(ids = "channel==MINE", metrics = "views", start_date = "2010-04-01", end_date ="2017-04-01")
  expect_that(get_info, is_a("list"))
})