library(dragonking)


### Name: ss_stat
### Title: Sum-sum (SS) test statistic to identify dragon kings (DKs)
### Aliases: ss_stat

### ** Examples

# generate a numeric vector with DKs
temp <- c(rexp(100),   # exponentially distributed RV
          15, 15, 15)  # DK elements

# calculate test statistic for DKs
ss_stat(temp, r = 3)



