context("find_stations tests")

test_that("find_stations returns errors if coords are outside Greece",{

  # lon_lim <- c(19, 30)
  # lat_lim <- c(34, 42)

  expect_error(find_stations(18, 40))
  expect_error(find_stations(31, 40))
  expect_error(find_stations(25, 33))
  expect_error(find_stations(25, 43))

})


test_that("find_stations returns a tibble", {


  expect_is(find_stations(22, 40), "tbl_df")

})
