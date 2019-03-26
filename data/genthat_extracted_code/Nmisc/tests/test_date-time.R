context("Testing data-time.R")


test_that("is.POSIXct(x) works", {
    date <- as.POSIXct("2018/02/13 12-55-51")
    expect_true(is.POSIXct(date))
})


test_that("format_utc() works for Date", {
    date <- lubridate::ymd(20101215)
    result <- format_utc(date)

    expect_match(result, "2010-12-15")
})


test_that("format_utc() works for Date, with format", {
    date <- lubridate::ymd(20101215)
    result <- format_utc(date, "%Y/%m/%d")

    expect_match(result, "2010/12/15")
})


test_that("format_utc() works for POSIXct", {
    date <- lubridate::ymd_hms("2018/02/13 12-55-51")
    result <- format_utc(date)

    expect_match(result, "2018-02-13 12:55:51 UTC")
})


test_that("format_utc() works for POSIXct with format", {
    date <- lubridate::ymd_hms("2018-02-13 12:55:51")
    result <- format_utc(date, "%Y/%m/%d %H-%M-%S")

    expect_match(result, "2018/02/13 12-55-51 UTC")
})


test_that("format_utc() works for Date, with format, with tz", {
    date <- lubridate::ymd_hms("2018-02-13 12:55:51")
    lubridate::tz(date) <- "America/Chicago" # UTC-6
    result <- format_utc(date, format = "%Y/%m/%d %H-%M-%S", usetz = TRUE)

    expect_match(result, "2018/02/13 18-55-51 UTC")
})


test_that("format_utc() stops with wrong input", {
    wrong_date <- "2018-02-13 12:55:51"
    expect_error(format_utc(wrong_date))
}) 


test_that("format_utc() stops with NA", {
    expect_error(format_utc(NA))
}) 


test_that("format_utc() stops Date, with format NA", {
    date <- lubridate::ymd(20101215)
    expect_error(format_utc(date, NA))
})


test_that("now_utc() works ", {
    now_utc_value <- now_utc(length = 0)
    expect_true(is.POSIXct(now_utc_value))
    expect_equal(lubridate::tz(now_utc_value), 'UTC')
    
    now_utc_value <- now_utc(length = 1)
    expect_true(is.POSIXct(now_utc_value))
    expect_equal(lubridate::tz(now_utc_value), 'UTC')
    sec_diff <- difftime(Sys.time(), now_utc_value, units = "secs")
    expect_true(sec_diff < 1)
})


test_that("now_utc() works with length vector of multiple elements", {
    now_utc_length1 <- length(now_utc(length = c(1, 2)))
    now_utc_expect_length1 <- length(now_utc(length = 1))
    expect_equal(now_utc_length1, now_utc_expect_length1)
    
    now_utc_length2 <- length(now_utc(length = c(2, 1)))
    now_utc_expect_length2 <- length(now_utc(length = 2))
    expect_equal(now_utc_length2, now_utc_expect_length2)
    
    length_values <- list(c(1, 2), c(2, 3))
    expect_error(now_utc(length =  length_values))
    
})


test_that("now_utc() stops with length NULL, NA", {
    
    expect_error(now_utc(length =  NULL))
    expect_error(now_utc(length =  NA))
    expect_error(now_utc(length =  c(NA, 1)))
    expect_error(now_utc(length =  c(NA, NA)))
})
