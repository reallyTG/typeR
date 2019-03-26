context("get_hydro")

test_that("get_hydro works", {
  skip_on_cran()
  
  expect_is(get_hydro(dbkey = "15081", date_min = "2013-01-01",
    date_max = "2013-02-02"), "data.frame")
  
  expect_is(get_hydro(dbkey = c("15081", "15069"), date_min = "2013-01-01",
    date_max = "2013-02-02"), "data.frame")
  
})

test_that("get_hydro fails well", {
  skip_on_cran()
  
  expect_error(get_hydro(dbkey = "15081", date_min = "1980-01-01",
    date_max = "1980-02-02"), "No data found")
  
})

test_that("non-character dates are handled", {
  skip_on_cran()
  
  expect_error(get_hydro(dbkey = "15081", date_min = 1980-01-01,
    date_max = "1980-02-02"),
    "Enter dates as quote-wrapped character strings in YYYY-MM-DD format")
  
})

test_that("get_hydro retrieves dbkeys on-the-fly", {
  skip_on_cran()
  
  expect_equal(ncol(get_hydro(stationid = "C-54", category = "GW",
            freq = "DA", date_min = "1990-01-01", date_max = "1990-02-02", 
            longest = TRUE)), 2) 
            
            
  expect_equal(ncol(get_hydro(stationid = c("C-54", "G-561"), 
                           category = "GW", freq = "DA", 
                           date_min = "1990-01-01", date_max = "1990-02-02", 
                           longest = TRUE)), 3)
  
})