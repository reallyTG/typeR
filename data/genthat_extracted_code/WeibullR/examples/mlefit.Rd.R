library(WeibullR)


### Name: mlefit
### Title: Maximum likelihood regression on Weibull and Lognormal
###   distributions
### Aliases: mlefit
### Keywords: regression reliability

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
weibull_fit<-mlefit(mleframe(failures,suspensions))



