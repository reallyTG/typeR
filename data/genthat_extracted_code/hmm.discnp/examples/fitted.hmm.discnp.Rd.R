library(hmm.discnp)


### Name: fitted.hmm.discnp
### Title: Fitted values of a discrete non-parametric hidden Markov model.
### Aliases: fitted.hmm.discnp
### Keywords: models

### ** Examples

P <- matrix(c(0.7,0.3,0.1,0.9),2,2,byrow=TRUE)
R <- matrix(c(0.5,0,0.1,0.1,0.3,
              0.1,0.1,0,0.3,0.5),5,2)
set.seed(42)
lll <- sample(250:350,20,TRUE)
y   <- rhmm(ylengths=lll,nsim=1,drop=TRUE,tpm=P,Rho=R)
fit <- hmm(y,K=2,verb=TRUE,keep.y=TRUE,itmax=10)
fv  <- fitted(fit)



