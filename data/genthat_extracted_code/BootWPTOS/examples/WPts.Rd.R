library(BootWPTOS)


### Name: WPts
### Title: Compute wavelet packet test statistic for test of stationarity.
### Aliases: WPts
### Keywords: ts

### ** Examples

#
# Generate some test data
#
x <- rnorm(512)
#
# Compute the test statistic on mother wavelets and packets from the finest
# scale and the THIRD finest scale
# 
J <- IsPowerOfTwo(length(x))
J
# [1] 9
#
x.ts <- WPts(x, levs=c(8, rep(6, 7)), indices=c(1, 1:7))
x.ts
# [1] 1.792252



