library(testthat)
library(lubridate)
library(efts)

context("Test that time series are read with the expected time indexing")

tempNcFname <- tempfile()
variable_names <- c("variable_1", "variable_2")
stations_ids <- c(123, 456)

nEns <- 3
nLead <- 4
x <- 1:(nEns * nLead)
x <- matrix(as.numeric(x), nrow = nLead)
y <- x + nEns * nLead

timeAxisStart <- ISOdate(year = 2015, month = 10, day = 4, hour = 0, min = 0, 
  sec = 0, tz = "Australia/Canberra")
start_time <- timeAxisStart + lubridate::hours(-1L)
v1 <- variable_names[1]
s1 <- stations_ids[1]
v2 <- variable_names[2]
s2 <- stations_ids[2]
time_dim_info <- create_time_info(from = timeAxisStart, n = 24L, tzoffset = "+1000")


# put tests in a tryCatch, to maximise the chances of cleaning up temporary
# files.
doTests <- function() {
  test_that("UTC offset is correctly read from the time dimension unit string", 
    {
      f <- function(h,m) { 
        b <- lubridate::origin + lubridate::dhours(as.integer(h)) + lubridate::dminutes(as.integer(m))
        b - lubridate::origin 
      }
      # WIRADA https://jira.csiro.au/browse/WIRADA-231
      x <- "hours since 2015-10-04 00:00:00 +1023"
      expect_equal(find_utc_offset(x), "+1023")
      expect_equal(find_utc_offset(x, FALSE), f(10,23))
      
      x <- "hours since 2015-10-04 00:00:00 -0837"
      expect_equal(find_utc_offset(x), "-0837")
      expect_equal(find_utc_offset(x, FALSE), -f(8,37))
      
      x <- "hours since 2015-10-04 00:00:00"
      expect_equal(find_utc_offset(x), "")
      expect_equal(find_utc_offset(x, FALSE), +f(0,0))
    })
}  # end doTests

tryCatch(doTests(), finally = function() {
  if (file.exists(tempNcFname)) 
    file.remove(tempNcFname)
}) 
