message("\nTesting handling of HTTP errors")

test_that("Error for invalid endpoint", {
  skip_on_cran()
  response <- get_response("/fakeEndpoint", query = list(format = "json", api_key = get_api_key()))
  expect_error(process_json_response(response), "\\[404\\]: [a-zA-Z0-9:/.]+fakeEndpoint")
})

test_that("Error for invalid API key", {
  skip_on_cran()
  response <- get_response("/query/getCollectionValues", query = list(format = "json", api_key = "fake_api_key"))
  expect_error(process_json_response(response), "\\[401\\]")
})

