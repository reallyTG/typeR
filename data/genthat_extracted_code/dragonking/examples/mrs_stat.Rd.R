library(dragonking)


### Name: mrs_stat
### Title: Max-robust-sum (MRS) test statistic to identify dragon kings
###   (DKs)
### Aliases: mrs_stat

### ** Examples

# generate a numeric vector with DKs
temp <- c(rexp(100),   # exponentially distributed RV
          15, 15, 15)  # DK elements

# calculate test statistic for DKs
mrs_stat(temp, r = 2, m = 3)



