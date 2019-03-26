library(delt)


### Name: delt-package
### Title: Estimation of Multivariate Densities Using Adaptive Partitions
### Aliases: delt-package delt
### Keywords: smooth

### ** Examples

library(denpro)

# Generate the data

dendat<-sim.data(n=500,seed=5,type="mulmodII")

# Calculate the estimates

eva<-eval.greedy(dendat,leaf=16)

eva<-eval.cart(dendat,leaf=16)

eva<-eval.bagg(dendat,B=3,leaf=12,prune="on")

eva<-eval.stage(dendat,leaf=10,M=3)

# Draw the estimates

lst<-leafsfirst(eva)
plotvolu(lst)

dp<-draw.pcf(eva,pnum=c(60,60))         
persp(dp$x,dp$y,dp$z,theta=-20,phi=30)




