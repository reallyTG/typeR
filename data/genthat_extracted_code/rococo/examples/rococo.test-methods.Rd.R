library(rococo)


### Name: rococo.test-methods
### Title: Robust Gamma Rank Correlation Test
### Aliases: rococo.test rococo.test-methods
###   rococo.test,numeric,numeric-method
###   rococo.test,formula,data.frame-method
### Keywords: htest methods

### ** Examples

## create data
f <- function(x) ifelse(x > 0.9, x - 0.9, ifelse(x < -0.9, x + 0.9, 0))
x <- rnorm(25)
y <- f(x) + rnorm(25, sd=0.1)

## perform correlation tests
rococo.test(x, y, similarity="classical", alternative="greater")
rococo.test(x, y, similarity="linear", alternative="greater")
rococo.test(x, y, similarity=c("classical", "gauss"), r=c(0, 0.1),
            alternative="greater", numtests=10000)

## the formula variant
require(datasets)
data(iris)
rococo.test(~ Petal.Width + Petal.Length, iris, similarity="linear",
            alternative="two.sided")



