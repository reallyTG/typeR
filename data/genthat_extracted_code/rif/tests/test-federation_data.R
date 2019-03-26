context("federation_data")

test_that("federation_data", {
  skip_on_cran()

  tt <- federation_data(id = "nlx_152871-2")

  expect_is(tt, "list")
  expect_is(tt$result, "list")
  expect_is(tt$result$resultCount, "integer")
  expect_match(tt$result$nifId, "nlx_152871-2")
  expect_is(tt$result$result, "data.frame")
  expect_is(tt$result$debugInfo, "character")
  expect_is(tt$result$results, "data.frame")
  expect_is(tt$query, "data.frame")
  expect_is(tt$messages, "list")
})
