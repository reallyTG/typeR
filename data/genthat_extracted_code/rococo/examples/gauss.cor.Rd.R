library(rococo)


### Name: gauss.cor
### Title: Gauss Rank Correlation Estimator
### Aliases: gauss.cor
### Keywords: htest

### ** Examples

## create data
f <- function(x) ifelse(x > 0.9, x - 0.9, ifelse(x < -0.9, x + 0.9, 0))
x <- rnorm(25)
y <- f(x) + rnorm(25, sd=0.1)

## compute correlation
gauss.cor(x, y)



