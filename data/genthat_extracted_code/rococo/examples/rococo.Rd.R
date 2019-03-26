library(rococo)


### Name: rococo
### Title: Robust Gamma Rank Correlation Coefficient
### Aliases: rococo
### Keywords: htest

### ** Examples

## create data
f <- function(x) ifelse(x > 0.9, x - 0.9, ifelse(x < -0.9, x + 0.9, 0))
x <- rnorm(25)
y <- f(x) + rnorm(25, sd=0.1)

## compute correlation
rococo(x, y, similarity="classical")
rococo(x, y, similarity="linear")
rococo(x, y, similarity=c("classical", "gauss"), r=c(0, 0.1))



