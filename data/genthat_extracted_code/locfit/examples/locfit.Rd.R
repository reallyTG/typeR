library(locfit)


### Name: locfit
### Title: Local Regression, Likelihood and Density Estimation.
### Aliases: locfit
### Keywords: smooth

### ** Examples

# fit and plot a univariate local regression
data(ethanol, package="locfit")
fit <- locfit(NOx ~ E, data=ethanol)
plot(fit, get.data=TRUE)

# a bivariate local regression with smaller smoothing parameter
fit <- locfit(NOx~lp(E,C,nn=0.5,scale=0), data=ethanol)
plot(fit)

# density estimation
data(geyser, package="locfit")
fit <- locfit( ~ lp(geyser, nn=0.1, h=0.8))
plot(fit,get.data=TRUE)



