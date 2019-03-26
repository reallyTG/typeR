library(BootMRMR)


### Name: weight.mbmr
### Title: Computation of weights for informative gene selection using
###   Modified Bootstrap MRMR technique
### Aliases: weight.mbmr
### Keywords: gene weights modified bootstrap

### ** Examples


data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
m=36
s=80
weight.mbmr(x, y, m, s, plot=FALSE)



