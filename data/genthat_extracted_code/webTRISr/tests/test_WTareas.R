library(testthat)
library(webTRISr)

test_that("WTares() returns dataframe", {
    x <- webtris_areas()
    expect_is(x, class = "data.frame")
    
    expected_variables <- c("Id", "Name", "Description", "XLongitude", 
        "XLatitude", "YLongitude", "YLatitude")
    
    expect_equivalent(expected_variables, colnames(x))
})


test_that("WTares(3) returns dataframe", {
    x <- webtris_areas(3)
    expect_is(x, class = "data.frame")
    
    expected_variables <- c("Id", "Name", "Description", "XLongitude", 
        "XLatitude", "YLongitude", "YLatitude")
    
    expect_equivalent(expected_variables, colnames(x))
})
