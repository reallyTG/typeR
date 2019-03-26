context("Web scraping")


has_internet <- function() {
    !is.null(curl::nslookup("r-project.org", error = FALSE))
}


test_that("Rugby", {
    
    skip_if(!has_internet())
    
    
    rugby <- get_rugby(c("2015", "2016"))
    expect_equal(nrow(rugby), 34)
    
})


# Function is broken so has been removed, for now

# test_that("Weather", {
#     
#     skip_if(!has_internet())
#     
#     
#     weather <- get_daily_weather("2015-01-01", "2016-05-01")
#     expect_equal(nrow(weather), 
#                  as.integer(as.Date("2016-05-01") - as.Date("2015-01-01")) + 1)
# })



test_that("Events", {
    
    skip_if(!has_internet())
    
    
    event_count <- get_events("2015-01-01", "2015-03-01")
    expect_equal(nrow(event_count), 
                 as.integer(as.Date("2015-03-01") - as.Date("2015-01-01")) + 1)
    expect_is(event_count$count, "numeric")
    expect_true(all(event_count$count >= 0))
    
    
    event_details <- get_events_detail("2015-01-01", "2015-01-03")
    expect_equal(nrow(event_details), sum(event_count$count[1:3]))
})
    