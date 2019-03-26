library(CircNNTSR)


### Name: nntsloglik
### Title: NNTS log-likelihood function
### Aliases: nntsloglik

### ** Examples

a<-c(runif(10,3*pi/2,2*pi-0.00000001),runif(10,pi/2,pi-0.00000001))
est<-nntsmanifoldnewtonestimation(a,2)
ccoef<-est$cestimates[,2]
nntsloglik(a,ccoef,2)



