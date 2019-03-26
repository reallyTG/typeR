library(simpleboot)


### Name: samples
### Title: Extract sampling distributions from bootstrapped linear/loess
###   models.
### Aliases: samples
### Keywords: utilities

### ** Examples

data(airquality)
attach(airquality)
lmodel <- lm(Ozone ~ Solar.R + Wind)
lboot <- lm.boot(lmodel, R = 500)

## Get sampling distributions for coefficients
s <- samples(lboot, "coef")

## Histogram for the intercept
hist(s[1,])




