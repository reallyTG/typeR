library(dragonking)


### Name: srs_stat
### Title: Sum-robust-sum (SRS) test statistic to identify dragon kings
###   (DKs)
### Aliases: srs_stat

### ** Examples

# generate a numeric vector with DKs
temp <- c(rexp(100),   # exponentially distributed RV
          15, 15, 15)  # DK elements

# calculate test statistic for DKs
srs_stat(temp, r = 2, m = 3)



