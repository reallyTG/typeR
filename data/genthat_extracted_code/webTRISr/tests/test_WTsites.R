library(testthat)
library(webTRISr)

test_that("webtris_sites() returns dataframe", {
    x <- webtris_sites()
    
    expect_is(x, class = "data.frame")
    expected_cols <- c("Id", "Name", "Description", "Longitude", 
        "Latitude", "Status")
    expect_equivalent(expected_cols, colnames(x))
})


test_that("webtris_quality(daily=FALSE) returns dataframe", {
    x <- webtris_sites(1)
    
    
    expect_is(x, class = "data.frame")
    expected_cols <- c("Id", "Name", "Description", "Longitude", 
        "Latitude", "Status")
    expect_equivalent(expected_cols, colnames(x))
})
