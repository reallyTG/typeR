library(Bolstad)


### Name: bayes.lin.reg
### Title: Bayesian inference for simple linear regression
### Aliases: bayes.lin.reg
### Keywords: misc

### ** Examples


## generate some data from a known model, where the true value of the
## intercept alpha is 2, the true value of the slope beta is 3, and the
## errors come from a normal(0,1) distribution
x = rnorm(50)
y = 22+3*x+rnorm(50)

## use the function with a flat prior for the slope beta and a
## flat prior for the intercept, alpha_xbar.

bayes.lin.reg(y,x)

## use the function with a normal(0,3) prior for the slope beta and a
## normal(30,10) prior for the intercept, alpha_xbar.

bayes.lin.reg(y,x,"n","n",0,3,30,10)

## use the same data but plot it and the credible interval

bayes.lin.reg(y,x,"n","n",0,3,30,10, plot.data = TRUE)

## The heart rate vs. O2 uptake example 14.1
O2 = c(0.47,0.75,0.83,0.98,1.18,1.29,1.40,1.60,1.75,1.90,2.23)
HR = c(94,96,94,95,104,106,108,113,115,121,131)
plot(HR,O2,xlab="Heart Rate",ylab="Oxygen uptake (Percent)")

bayes.lin.reg(O2,HR,"n","f",0,1,sigma=0.13)

## Repeat the example but obtain predictions for HR = 100 and 110

bayes.lin.reg(O2,HR,"n","f",0,1,sigma=0.13,pred.x=c(100,110))




