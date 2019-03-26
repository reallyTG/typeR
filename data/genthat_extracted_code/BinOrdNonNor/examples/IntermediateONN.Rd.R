library(BinOrdNonNor)


### Name: IntermediateONN
### Title: Computes the intermediate (biserial/polyserial) correlations
###   given the point-biserial/polyserial correlations for
###   binary/ordinal-continuous pairs prior to
###   dichotomization/ordinalization
### Aliases: IntermediateONN

### ** Examples

no.bin <- 1
no.ord <- 2
no.NN <- 4
q <- no.bin + no.ord + no.NN
set.seed(54321)

Sigma <- diag(q)
Sigma[lower.tri(Sigma)] <- runif((q*(q-1)/2),-0.4,0.4)
Sigma <- Sigma + t(Sigma)
diag(Sigma) <- 1

marginal <- list(0.3, cumsum( c(0.30, 0.40) ), cumsum(c(0.4, 0.2, 0.3) ) )
ONNCorrMat <- Sigma[4:7, 1:3]
IntermediateONN(marginal, skew.vec=c(1,2,2,3), kurto.vec=c(2,7,25,25), ONNCorrMat)



