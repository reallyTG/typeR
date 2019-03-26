library(Rfit)


### Name: Rfit-package
### Title: Rank-Based Estimates and Inference for Linear Models
### Aliases: Rfit-package Rfit
### Keywords: nonparametric robust regression package

### ** Examples

data(baseball)
data(wscores)
fit<-rfit(weight~height,data=baseball)
summary(fit)
plot(fitted(fit),rstudent(fit))

### Example of the Reduction (Drop) in dispersion test ###
y<-rnorm(47)
x1<-rnorm(47)
x2<-rnorm(47)
fitF<-rfit(y~x1+x2)
fitR<-rfit(y~x1)
drop.test(fitF,fitR)






