context("Adding records")


has_internet <- function() {
    !is.null(curl::nslookup("r-project.org", error = FALSE))
}

    
test_that("Adding records for the first time", {
    
    skip_if(!has_internet())
    
    
    raw <- get_all_crude()
    
    # We're expecting a lot of records...!
    expect_true(nrow(raw) > 2000000)
    expect_equal(as.character(min(raw$lastupdate)), "2014-10-17 15:43:21")
    expect_equal(as.Date(max(raw$dateuploaded)), Sys.Date())

    
    
    raw_range <- get_range_crude("2015-01-01 06:00:00", "2015-01-01 12:00:00", abbrs = "as")
    
    expect_equal(nrow(raw_range), 72)
    expect_equal(as.character(min(raw_range$dateuploaded)), "2015-01-01 06:00:01")
    expect_equal(as.character(max(raw_range$dateuploaded)), "2015-01-01 11:55:01")
    
})



test_that("Updating with latest records", {
    
    skip_if(!has_internet())
    
    
    raw <- get_range_crude("2018-01-01 00:00:00", "2018-01-01 12:00:00")
    refined <- refine(raw)
    
    raw_refuelled <- refuel_crude(raw)
    expect_gte(nrow(raw_refuelled), nrow(raw))
    expect_equal(as.Date(max(raw_refuelled$dateuploaded)), Sys.Date())
    
    
    refined <- refine(raw_refuelled)
    refined_refuelled <- refuel(refined)
    expect_gte(nrow(refined_refuelled), nrow(refined))
    expect_equal(as.Date(max(refined_refuelled$DateUploaded)), Sys.Date())
    
})