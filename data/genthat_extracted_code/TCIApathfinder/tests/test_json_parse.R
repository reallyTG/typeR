message("\nTesting handling of invalid JSON")

test_that("Error for invalid JSON", {
  skip_on_cran()
  response <- get_response("/query/getCollectionValues",
                           query = list(format = "html",
                                        api_key = get_api_key()))
  expect_error(check_json(response), "API did not return JSON")
  expect_error(process_json_response(response), "API did not return JSON")
})

