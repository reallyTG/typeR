library(lmomco)


### Name: Lcomoment.coefficients
### Title: L-comoment Coefficient Matrix
### Aliases: Lcomoment.coefficients
### Keywords: multivariate L-comoment

### ** Examples

D      <- data.frame(X1=rnorm(30), X2=rnorm(30), X3=rnorm(30))
L1     <- Lcomoment.matrix(D,k=1)
L2     <- Lcomoment.matrix(D,k=2)
L3     <- Lcomoment.matrix(D,k=3)
LkLCV  <- Lcomoment.coefficients(L1,L2)
LkTAU3 <- Lcomoment.coefficients(L3,L2)



