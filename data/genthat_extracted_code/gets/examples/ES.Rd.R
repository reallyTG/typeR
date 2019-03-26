library(gets)


### Name: ES
### Title: Conditional Value-at-Risk (VaR) and Expected Shortfall (ES)
### Aliases: ES VaR
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##generate random variates, estimate model:
y <- rnorm(50)
mymodel <- arx(y, arch=1)

##extract 99% expected shortfall:
ES(mymodel)

##extract 99%, 95% and 90% expected shortfalls:
ES(mymodel, level=c(0.99, 0.95, 0.9))

##extract 99% value-at-risk:
VaR(mymodel)

##extract 99%, 95% and 90% values-at-risk:
VaR(mymodel, level=c(0.99, 0.95, 0.9))



