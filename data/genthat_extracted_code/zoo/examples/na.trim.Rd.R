library(zoo)


### Name: na.trim
### Title: Trim Leading/Trailing Missing Observations
### Aliases: na.trim na.trim.default na.trim.ts
### Keywords: ts

### ** Examples

# examples of na.trim
x <- zoo(c(1, 4, 6), c(2, 4, 6))
xx <- zoo(matrix(c(1, 4, 6, NA, 5, 7), 3), c(2, 4, 6))
na.trim(x)
na.trim(xx)

# using na.trim for alignment
# cal defines the legal dates
# all dates within the date range of x should be present
cal <- zoo(,c(1, 2, 3, 6, 7))
x <- zoo(c(12, 16), c(2, 6))
na.trim(merge(x, cal))




