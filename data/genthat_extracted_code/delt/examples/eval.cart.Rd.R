library(delt)


### Name: eval.cart
### Title: Calculates a CART histogram
### Aliases: eval.cart
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=600,seed=5,type="mulmodII")
eva<-eval.cart(dendat,16)

dp<-draw.pcf(eva,pnum=c(60,60))
persp(dp$x,dp$y,dp$z,theta=-20,phi=30)




