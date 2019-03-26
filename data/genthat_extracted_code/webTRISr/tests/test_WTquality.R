library(testthat)
library(webTRISr)

test_that("webtris_quality() returns dataframe", {
    x <- webtris_quality(siteID = "1", start_date = "01-01-2017",
        lubridate::dmy("07-01-2017"), daily = TRUE)

    expect_is(x, class = "data.frame")
    expect_equivalent(c("Date", "Quality"), colnames(x))
})


test_that("webtris_quality(daily=FALSE) returns dataframe", {
    x <- webtris_quality(siteID = c("1", "3"), start_date = "01-01-2017",
        lubridate::dmy("07-01-2017"), daily = FALSE)


    expect_is(x, class = "data.frame")

    expected_cols <- c("row_count", "start_date", "end_date",
        "data_quality", "sites")
    expect_equivalent(colnames(x), expected_cols)
})

test_that("webtris_quality(daily=FALSE) returns value 100", {
  x <- webtris_quality(siteID = '5688', start_date = "01012018",
                       end_date = "03012018", daily = FALSE)

  expect_equal(x$data_quality, 100)
})
