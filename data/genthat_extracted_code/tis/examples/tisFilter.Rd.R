library(tis)


### Name: tisFilter
### Title: Linear Filtering on a Time Series
### Aliases: tisFilter
### Keywords: ts

### ** Examples

x <- tis(1:100, start = c(2000,1), freq = 12)
tisFilter(x, rep(1, 3))
tisFilter(x, rep(1, 3), sides = 1)
tisFilter(x, rep(1, 3), sides = 1, circular = TRUE)



