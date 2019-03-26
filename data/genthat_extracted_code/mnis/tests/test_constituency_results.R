
library(mnis)
context("mnis_constituency_results")
test_that("mnis_constituency_results returns expected format", {

  skip_on_cran()

  xmniscons <- mnis_constituency_results(constituency_id = 3709, election_id = 0)
  expect_length(xmniscons, 2)
  expect_type(xmniscons, "list")
  expect_true(is.list(xmniscons))
  expect_length(xmniscons$results, 7)
  expect_type(xmniscons$results, "list")
  expect_true(tibble::is.tibble(xmniscons$results))
  expect_length(xmniscons$details, 20)
  expect_type(xmniscons$details, "list")
  expect_true(is.list(xmniscons$details))



})
