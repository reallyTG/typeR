library(RcppTN)


### Name: dtn
### Title: Truncated Normal Distribution Density
### Aliases: dtn

### ** Examples

lows <- c(-1, 5, -100, 4, 4, -100, 7)
highs <- c(1, 100, 10, 7, 4.1, 100, 100)
dtn(.x = rep(0, length(lows)),
    .mean = rep(0, length(lows)),
    .sd = rep(1, length(lows)),
    .high = highs
    )



