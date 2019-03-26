library(hbim)


### Name: equiv.increase
### Title: Calculate equivalent increase from two dose-response curves
### Aliases: equiv.increase
### Keywords: arith

### ** Examples

data(deff.sigma)
D<-deff.sigma
equiv.increase(D$mu,D$out1[,2],D$mu,D$out2[,2],.5)



