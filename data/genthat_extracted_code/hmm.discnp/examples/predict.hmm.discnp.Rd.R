library(hmm.discnp)


### Name: predict.hmm.discnp
### Title: Predicted values of a discrete non-parametric hidden Markov
###   model.
### Aliases: predict.hmm.discnp
### Keywords: models

### ** Examples

P <- matrix(c(0.7,0.3,0.1,0.9),2,2,byrow=TRUE)
R <- matrix(c(0.5,0,0.1,0.1,0.3,
              0.1,0.1,0,0.3,0.5),5,2)
set.seed(42)
ll1 <- sample(250:350,20,TRUE)
y1  <- rhmm(ylengths=ll1,nsim=1,tpm=P,Rho=R,drop=TRUE)
fit <- hmm(y1,K=2,verb=TRUE,keep.y=TRUE,itmax=10)
fv  <- fitted(fit)
set.seed(176)
ll2 <- sample(250:350,20,TRUE)
y2  <- rhmm(ylengths=ll2,nsim=1,tpm=P,Rho=R,drop=TRUE)
pv  <- predict(fit,y=y2)



