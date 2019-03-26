library(sirt)


### Name: eigenvalues.sirt
### Title: First Eigenvalues of a Symmetric Matrix
### Aliases: eigenvalues.sirt
### Keywords: Eigenvalues

### ** Examples

Sigma <- diag(1,3)
Sigma[ lower.tri(Sigma) ] <- Sigma[ upper.tri(Sigma) ] <- c(.4,.6,.8 )
eigenvalues.sirt(X=Sigma, D=2 )
# compare with svd function
svd(Sigma)



