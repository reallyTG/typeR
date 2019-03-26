library(nlnet)


### Name: stage.forward
### Title: Nonlinear Forward stagewise regression using DCOL
### Aliases: stage.forward
### Keywords: nonparametric variable selection

### ** Examples

X<-matrix(rnorm(2000),ncol=20)
y<-sin(X[,1])+X[,2]^2+X[,3]
stage.forward(t(X),y,stop.alpha=0.001,step.size=0.05)



