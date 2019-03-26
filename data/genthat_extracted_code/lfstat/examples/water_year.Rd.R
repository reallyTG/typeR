library(lfstat)


### Name: water_year
### Title: Compute the water year
### Aliases: water_year
### Keywords: low-flow

### ** Examples

# generating monthly sequence
x <- seq(from = as.Date("1992-01-01"),
         by = "months", length.out = 12)

# specifying the beginning with a decimal number
water_year(x, origin = 10)

# using a month name
water_year(x, origin = "Jul")      # can be abbreviated
water_year(x, origin = "july")     # case insensitive

# using an POSIX or Date object
water_year(x, origin = as.Date("2012-08-22"))     # only month is taken
water_year(x, origin = as.POSIXct("2012-08-22"))

# or by specifying an institution
water_year(x, origin = "usgs")



