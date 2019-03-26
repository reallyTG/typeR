context("Class")


test_that("class", {
  expect_error(new("TemporalIso", NULL, NULL))
})
