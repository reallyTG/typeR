library(e1071)


### Name: probplot
### Title: Probability Plot
### Aliases: probplot lines.probplot
### Keywords: hplot

### ** Examples

## a simple example
x <- rnorm(100, mean=5)
probplot(x)

## the same with horizontal tickmarks at the y-axis
opar <- par("las")
par(las=1)
probplot(x)

## this should show the lack of fit at the tails
probplot(x, "qunif")

## for increasing degrees of freedom the t-distribution converges to
## normal
probplot(x, qt, df=1)
probplot(x, qt, df=3)
probplot(x, qt, df=10)
probplot(x, qt, df=100)

## manually add the line through the quartiles
p <- probplot(x, line=FALSE)
lines(p, col="green", lty=2, lwd=2)


## Make the line at prob=0.5 red
lines(p, h=0.5, col="red")

### The following use the estimted distribution given by the green
### line:

## What is the probability that x is smaller than 7?
lines(p, v=7, bend=TRUE, col="blue")

## Median and 90% confidence interval
lines(p, h=.5, col="red", lwd=3, bend=TRUE)
lines(p, h=c(.05, .95), col="red", lwd=2, lty=3, bend=TRUE)

par(opar)



