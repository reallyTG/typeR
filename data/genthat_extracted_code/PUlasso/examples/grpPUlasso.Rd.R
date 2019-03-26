library(PUlasso)


### Name: grpPUlasso
### Title: Solve PU problem with lasso or group lasso penalty.
### Aliases: grpPUlasso

### ** Examples

data("simulPU")
fit<-grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1)



