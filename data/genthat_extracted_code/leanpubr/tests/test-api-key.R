test_that("Breaking for API Key", {

  expect_error(lp_api_key(api_key = ""))
  expect_silent(lp_api_key(api_key = "", error = FALSE))

})
