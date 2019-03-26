library(WeibullR)


### Name: lslr
### Title: Least squares linear regression with many optional methods
### Aliases: lslr
### Keywords: regression reliability

### ** Examples

failures<-c(90,96,30,49,82)
suspensions<-c(100,45,10)
default_weibull_fit<-lslr(getPPP(failures,suspensions))



