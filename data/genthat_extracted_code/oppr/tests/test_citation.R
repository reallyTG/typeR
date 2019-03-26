context("package citation")

test_that("citation", {
  expect_is(citation("oppr"), "citation")
})
