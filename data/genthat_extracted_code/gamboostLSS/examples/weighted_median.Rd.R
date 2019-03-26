library(gamboostLSS)


### Name: weighted.median
### Title: Weighted Median
### Aliases: weighted.median
### Keywords: methods

### ** Examples


## compute the weighted median with case weights
x <- c(1, 2, 3, 4)
w <- c(0, 1, 2, 3)
weighted.median(x, w)

## compute the weighted median with arbitrary weights
x <- rnorm(100)
w <- runif(100)
weighted.median(x, w)




