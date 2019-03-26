library(rococo)


### Name: gauss.cor.test-methods
### Title: Gaussian rank correlation test
### Aliases: gauss.cor.test gauss.cor.test-methods
###   gauss.cor.test,numeric,numeric-method
###   gauss.cor.test,formula,data.frame-method
### Keywords: htest methods

### ** Examples

## create data
f <- function(x) ifelse(x > 0.9, x - 0.9, ifelse(x < -0.9, x + 0.9, 0))
x <- rnorm(25)
y <- f(x) + rnorm(25, sd=0.1)

## perform correlation tests
gauss.cor.test(x, y, alternative="greater")

## the formula variant
require(datasets)
data(iris)
gauss.cor.test(~ Petal.Width + Petal.Length, iris,
               alternative="two.sided")



