library(dragonking)


### Name: ms_stat
### Title: Max-sum (MS) test statistic to identify dragon kings (DKs)
### Aliases: ms_stat

### ** Examples

# generate a numeric vector with DKs
temp <- c(rexp(100),   # exponentially distributed RV
          15, 15, 15)  # DK elements

# calculate test statistic for DKs
ms_stat(temp, r = 3)



