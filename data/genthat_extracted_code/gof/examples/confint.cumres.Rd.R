library(gof)


### Name: confint.cumres
### Title: Returns prediction bands for 'cumres' object
### Aliases: confint.cumres
### Keywords: models regression

### ** Examples

n <- 500; x <- abs(rnorm(n,sd=0.2))+0.01; y <- sqrt(x) + rnorm(n,sd=0.2)
l <- lm(y ~ x)
g <- cumres(l, R=1000)
confint(g,1)



