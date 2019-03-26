library(hmm.discnp)


### Name: sp
### Title: Calculate the conditional state probabilities.
### Aliases: sp
### Keywords: models

### ** Examples

P <- matrix(c(0.7,0.3,0.1,0.9),2,2,byrow=TRUE)
R <- matrix(c(0.5,0,0.1,0.1,0.3,
              0.1,0.1,0,0.3,0.5),5,2)
set.seed(42)
y.num   <- rhmm(ylengths=rep(300,20),nsim=1,tpm=P,Rho=R,drop=TRUE)
fit.num <- hmm(y.num,K=2,verb=TRUE,keep.y=TRUE,itmax=10)
cpe1    <- sp(model=fit.num,means=TRUE) # Using the estimated parameters.
cpe2    <- sp(y.num,tpm=P,Rho=R,means=TRUE,
              warn=FALSE) # Using the ``true'' parameters.
# The foregoing would issue a warning that Rho had no row names
# were it not for the fact that "warn" has been set to FALSE.



