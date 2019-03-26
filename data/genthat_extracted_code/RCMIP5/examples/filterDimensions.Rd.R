library(RCMIP5)


### Name: filterDimensions
### Title: Filter dimensions, limiting to arbitrary lon/lat/Z/time ranges
### Aliases: filterDimensions

### ** Examples

d <- cmip5data(1970:2014)   # sample data
filterDimensions(d, yearRange=c(1980, 1985))
filterDimensions(d, monthRange=c(6, 8))  # summer
filterDimensions(d, latRange=c(-20, 20))  # the tropics
filterDimensions(d, latRange=c(-20, 20), monthRange=c(6, 8))  # tropical summer



