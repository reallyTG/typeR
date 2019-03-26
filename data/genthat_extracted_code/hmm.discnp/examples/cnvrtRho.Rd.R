library(hmm.discnp)


### Name: cnvrtRho
### Title: Convert Rho between forms.
### Aliases: cnvrtRho
### Keywords: utilities

### ** Examples

Yval <- LETTERS[1:10]
Tpm  <- matrix(c(0.75,0.25,0.25,0.75),ncol=2,byrow=TRUE)
Rho  <- cbind(c(rep(1,5),rep(0,5)),c(rep(0,5),rep(1,5)))/5
rownames(Rho) <- Yval
newRho <- cnvrtRho(Rho)
oldRho <- cnvrtRho(newRho)



