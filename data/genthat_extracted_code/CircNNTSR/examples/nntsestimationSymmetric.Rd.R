library(CircNNTSR)


### Name: nntsestimationSymmetric
### Title: NNTS Symmetric Coefficient estimation
### Aliases: nntsestimationSymmetric

### ** Examples

b<-c(runif(10,3*pi/2,2*pi-0.00000001),runif(10,pi/2,pi-0.00000001))
estS<-nntsestimationSymmetric(2,b)
nntsplotSymmetric(estS$coef,2)



