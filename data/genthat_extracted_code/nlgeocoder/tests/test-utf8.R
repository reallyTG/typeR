context("utf8")

test_that("Dvorákhof", {
  res <- nl_suggest("Dvorákhof")
  expect_true(res$response$numFound > 0)
})
