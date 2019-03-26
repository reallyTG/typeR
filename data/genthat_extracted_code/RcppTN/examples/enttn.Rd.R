library(RcppTN)


### Name: enttn
### Title: Truncated Normal Distribution Entropy
### Aliases: enttn

### ** Examples

lows <- c(-1, 5, -100, 4, 4, -100, 7)
highs <- c(1, 100, 10, 7, 4.1, 100, 100)
enttn(.mean = rep(0, length(lows)),
      .sd = rep(1, length(lows)),
      .low = lows,
      .high = highs
      )




