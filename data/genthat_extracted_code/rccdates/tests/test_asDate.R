context("asDate")

test_that("", {
  expect_that(asDate(Sys.Date()), is_identical_to(Sys.Date()))
  expect_that(asDate("19850504"), is_equivalent_to(as.Date(NA)))
  expect_that(asDate("1985-05-04"), is_equivalent_to(as.Date("1985-05-04")))
})