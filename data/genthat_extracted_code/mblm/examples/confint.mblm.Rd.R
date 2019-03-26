library(mblm)


### Name: confint.mblm
### Title: Confidence Intervals for 'mblm' Model
### Aliases: confint.mblm
### Keywords: models

### ** Examples

set.seed(1234)
x <- 1:100+rnorm(100)
y <- x+rnorm(100)
y[100] <- 200
fit <- mblm(y~x)
fit
summary(fit)
confint(fit)



