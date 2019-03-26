# Load the test authentication credentials
# Skip tests if this file is not available
try(
  source("test_auth.R")
)

test_that("There is a correct reponse from a couchdb server", {
  if (!exists("unauthorized_conn")) skip("skipping this")
  result <- couch_ping(unauthorized_conn)
  expect_equal(result$status_code, 200)
})