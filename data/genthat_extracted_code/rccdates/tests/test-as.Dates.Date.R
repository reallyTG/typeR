
context("as.Dates.Date")

test_that("misc", {
  expect_that(as.Dates.Date(Sys.Date()), is_a("Date"))
  expect_that(as.Dates.Date(Sys.Date()), is_identical_to(Sys.Date()))
})