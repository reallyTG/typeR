library(Rfit)


### Name: rfit
### Title: Rank-based Estimates of Regression Coefficients
### Aliases: rfit rfit.default
### Keywords: nonparametric robust regression

### ** Examples

data(baseball)
data(wscores)
fit<-rfit(weight~height,data=baseball)
summary(fit)



