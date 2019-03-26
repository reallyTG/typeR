context("get_wq")

test_that("get_wq works", {
  skip_on_cran()
  
  expect_is(get_wq(station_id = c("FLAB08", "FLAB09"), date_min = "2011-03-01",
    date_max = "2012-05-01", test_name = "CHLOROPHYLLA-SALINE"), "data.frame")
  
})

test_that("get_wq fails well", {
  skip_on_cran()

  expect_message(get_wq(station_id = c("FLAB08", "FLAB09"),
    date_min = "1990-03-01", date_max = "1992-05-01",
    test_name = "CHLOROPHYLLA-SALINE"), "No data found")
  
  expect_message(get_wq(station_id = "ROOK467", date_min = "2012-07-19",
    date_max = "2016-04-27", test_name = "AMMONIA-N"), "No data found")
  
  expect_message(get_wq("FLAB01", "1983-09-14", "1986-09-18",
                "NITRATE+NITRITE-N", raw = TRUE), "No data found")
  
})

test_that("non-character dates are handled", {
  skip_on_cran()
  
  expect_error(get_wq(station_id = c("FLAB08", "FLAB09"), date_min = 1990-03-01,
    date_max = 1992-05-01, test_name = "CHLOROPHYLLA-SALINE"),
    "Enter dates as quote-wrapped character strings in YYYY-MM-DD format")
  
})

test_that("mdl_handling inputs are sane", {
  skip_on_cran()
  
  expect_error(clean_wq(get_wq("FLAB01", "2014-09-14", "2014-09-18",
    "NITRATE+NITRITE-N", raw = TRUE), mdl_handling = "crazy"),
    "mdl_handling must be one of 'raw', 'half', or 'full'")
})

test_that("mdl handling occurs when get_wq raw is TRUE", {
  skip_on_cran()
  
  expect_equal(
    get_wq("FLAB01", "2014-09-14", "2014-09-18", "NITRATE+NITRITE-N",
          raw = TRUE, mdl_handling='half')$Value,
    get_wq("FLAB01", "2014-09-14", "2014-09-18", "NITRATE+NITRITE-N",
          raw = FALSE, mdl_handling='half')[,2])
})

test_that("multiple stations return correct num of columns", {
  skip_on_cran()
  
  expect_equal(ncol(get_wq(station_id = c("FLAB08","FLAB09"),
    date_min = "2011-03-01", date_max = "2012-05-01",
    test_name = "CHLOROPHYLLA-SALINE")), 3)
  
})
