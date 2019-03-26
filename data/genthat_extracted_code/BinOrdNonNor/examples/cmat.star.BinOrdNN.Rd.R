library(BinOrdNonNor)


### Name: cmat.star.BinOrdNN
### Title: Computes the intermediate correlation matrix
### Aliases: cmat.star.BinOrdNN

### ** Examples

## Not run:
no.bin <- 1
no.ord <- 2
no.NN <- 4
q <- no.bin + no.ord + no.NN
set.seed(54321)

Sigma <- diag(q)
Sigma[lower.tri(Sigma)] <- runif((q*(q-1)/2),-0.4,0.4)
Sigma <- Sigma + t(Sigma)
diag(Sigma) <- 1

marginal <- list(0.3, cumsum(c(0.30, 0.40) ), cumsum(c(0.4, 0.2, 0.3) ) )
cmat.star <- cmat.star.BinOrdNN(plist=marginal, skew.vec=c(1,2,2,3), 
kurto.vec=c(2,7,25,25),no.bin=1, no.ord=2, no.NN=4, CorrMat=Sigma) 
## End(Not run)



