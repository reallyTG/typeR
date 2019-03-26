context("Minimal Unit Testing")
test_that("the functions of randquotes", {

  expect_that(randquote(), is_a("data.frame"))
  expect_that(randquote_simple(), is_a("character"))

})
