library(dragonking)


### Name: dixon_stat
### Title: Dixon test statistic to identify dragon kings (DKs)
### Aliases: dixon_stat

### ** Examples

# generate a numeric vector with DKs
temp <- c(rexp(100),   # exponentially distributed RV
          15, 15, 15)  # DK elements

# calculate test statistic for DKs
dixon_stat(temp, r = 3)



