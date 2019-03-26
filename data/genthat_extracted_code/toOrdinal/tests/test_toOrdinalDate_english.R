context("English date tests")

test_that("toOrdinalDate correctly converts dates", {
  test_date <- "October 9th, 2017"
  using_toOrdinalDate <- toOrdinalDate("2017-10-09")

  expect_equal(
    test_date, using_toOrdinalDate
  )
})
