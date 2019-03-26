library(PUlasso)


### Name: deviances
### Title: Deviance
### Aliases: deviances

### ** Examples

data("simulPU")
coef0<-replicate(2,runif(ncol(simulPU$X)+1))
deviances(simulPU$X,simulPU$z,pi=simulPU$truePY1,coefMat = coef0)



