library(bit64)


### Name: cumsum.integer64
### Title: Cumulative Sums, Products, Extremes and lagged differences
### Aliases: cummin.integer64 cummax.integer64 cumsum.integer64
###   cumprod.integer64 diff.integer64
### Keywords: classes manip

### ** Examples

  cumsum(rep(as.integer64(1), 12))
  diff(as.integer64(c(0,1:12)))
  cumsum(as.integer64(c(0, 1:12)))
  diff(cumsum(as.integer64(c(0,0,1:12))), differences=2)



