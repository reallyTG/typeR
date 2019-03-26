library(nlnet)


### Name: nvsd
### Title: Nonlinear Variable Selection based on DCOL
### Aliases: nvsd
### Keywords: nonparametric variable selection

### ** Examples

X<-matrix(rnorm(2000),ncol=20)
y<-sin(X[,1])+X[,2]^2+X[,3]
nvsd(t(X),y,stop.alpha=0.001,step.size=0.05)



