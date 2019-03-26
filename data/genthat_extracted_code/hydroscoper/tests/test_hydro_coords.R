context("hydro_coords tests")

test_that("hydro_coords returns a tibble with lat and long values", {

  pnt <- c("SRID=4326;POINT (22.41211 39.07562)",
           "POINT (25.91659 40.93200)",
           "POINT (35.24414242152967)",
           NA,
           "",
           "38.81464027659262",
           "POINT ()")

  res <- tibble::tibble(long = c(22.41211, 25.91659, NA, NA, NA, NA, NA),
                    lat =  c(39.07562, 40.93200, NA, NA, NA, NA, NA))
  expect_is(hydro_coords(pnt), "tbl_df")
  expect_equal(hydro_coords(pnt), res)

})
