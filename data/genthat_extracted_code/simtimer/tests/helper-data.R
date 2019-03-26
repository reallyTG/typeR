# Helper file. Set global test parameters available in all testthat sections
# Use helper-synthetic_data for synthetic data like data.frames, ...


origin_date <- as.POSIXct("2016-01-01 00:00:00", tz = "UTC")
t_20160101 <- as.POSIXct("2016-01-01 00:00:00", tz = "UTC") # = origin_date!
t_20160102 <- as.POSIXct("2016-01-02 00:00:00", tz = "UTC")
t_20170101 <- as.POSIXct("2017-01-01 00:00:00", tz = "UTC")

# Set upper bounds for microbenchmark tests. Set units via
# microbenchmark::microbenchmark(function(), times = nL, unit = "us"):
t_500us <- 500 # 500 us

