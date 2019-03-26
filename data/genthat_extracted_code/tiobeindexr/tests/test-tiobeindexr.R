context("minimal package functionality")
test_that("we can do something", {

  expect_that(top_20(), is_a("data.frame"))
  expect_that(top_50(), is_a("data.frame"))
  expect_that(hall_of_fame(), is_a("data.frame"))

})
