message("\nTesting API user agent")

test_that("User agent is GitHub repo", {
  skip_on_cran()
  response <- get_response("/query/getCollectionValues",
                           query = list(format = "json",
                                        api_key = get_api_key()))
  expect_identical(response[["request"]][["options"]][["useragent"]], "https://github.com/pamelarussell/TCIApathfinder")
})

