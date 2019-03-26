library(lubridate)


### Name: leap_year
### Title: Is a year a leap year?
### Aliases: leap_year
### Keywords: chron logic

### ** Examples

x <- as.Date("2009-08-02")
leap_year(x) # FALSE
leap_year(2009) # FALSE
leap_year(2008) # TRUE
leap_year(1900) # FALSE
leap_year(2000) # TRUE



