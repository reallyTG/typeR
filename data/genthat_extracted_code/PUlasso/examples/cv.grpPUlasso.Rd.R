library(PUlasso)


### Name: cv.grpPUlasso
### Title: Cross-validation for PUlasso
### Aliases: cv.grpPUlasso

### ** Examples

data("simulPU")
fit<-cv.grpPUlasso(X=simulPU$X,z=simulPU$z,pi=simulPU$truePY1)



