library(BinOrdNonNor)


### Name: validate.target.cormat.BinOrdNN
### Title: Checks the validity of the target correlation matrix
### Aliases: validate.target.cormat.BinOrdNN

### ** Examples

Sigma <- diag(4)
Sigma[lower.tri(Sigma)] <- c(0.42, 0.55, 0.29, 0.37, 0.14, 0.26)
Sigma <- Sigma + t(Sigma)
diag(Sigma) <- 1

marginal <- list(0.2, c(0.4, 0.7, 0.9))

validate.target.cormat.BinOrdNN(plist=marginal, skew.vec=c(1,2), kurto.vec=c(2,7), 
                                no.bin=1, no.ord=1, no.NN=2, CorrMat=Sigma)



