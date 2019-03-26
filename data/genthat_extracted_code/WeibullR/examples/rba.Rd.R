library(WeibullR)


### Name: rba
### Title: Reduced Bias Adjustment for Weibull and Lognormal MLE
### Aliases: rba
### Keywords: likelihood

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
MLEfit<-mlefit(mleframe(failures,suspensions))
MLE_RBA<-c(MLEfit[1],MLEfit[2]*rba(length(failures)))



