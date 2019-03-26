context("age")

test_that("basic age calcs", {
  expect_equal(
    age_from_dates(
      birth_date = "2000-01-01",
      ref_date = "2005-01-01", unit = "year"), 5, tolerance = 0.1)
  expect_equal(
    age_from_dates(
      birth_date = "2000-01-01",
      ref_date = "2005-01-01", unit = "month"), 60, tolerance = 0.1)
  expect_equal(
    age_from_dates(
      birth_date = "2000-01-01",
      ref_date = "2000-01-08", unit = "day"), 7, tolerance = 0.01)
})

test_that("age under zero", {
  expect_error(age_from_dates("2001-12-31", "2000-01-01"))
})
