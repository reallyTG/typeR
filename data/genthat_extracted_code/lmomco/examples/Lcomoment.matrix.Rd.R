library(lmomco)


### Name: Lcomoment.matrix
### Title: Compute Sample L-comoment Matrix
### Aliases: Lcomoment.matrix
### Keywords: multivariate L-comoment

### ** Examples

D  <- data.frame(X1=rnorm(30), X2=rnorm(30), X3=rnorm(30))
L1 <- Lcomoment.matrix(D,k=1)
L2 <- Lcomoment.matrix(D,k=2)



