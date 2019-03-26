library(valuer)


### Name: constant_parameters
### Title: Constant parameter class
### Aliases: constant_parameters
### Keywords: datasets

### ** Examples

r <- constant_parameters$new(0.01)
#Over the full year (365 days) the integral should evaluate to 0.01
r$integral(timeDate::timeDate("2016-07-09"), timeDate::timeDate("2017-07-09"))
#Over the full year the integral square should evaluate to 0.001
r$integral_square(timeDate::timeDate("2016-07-09"), timeDate::timeDate("2017-07-09"))



