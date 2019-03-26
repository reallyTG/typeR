library(FAdist)


### Name: LNORM3
### Title: Three-Parameter Lognormal Distribution
### Aliases: dlnorm3 plnorm3 qlnorm3 rlnorm3
### Keywords: distribution

### ** Examples

m <- 100
x <- rlnorm3(10,1,0,m)
dlnorm3(x,1,0,m)
dlnorm(x-m,0,1)
dnorm(log(x-m),0,1)/(x-m)



