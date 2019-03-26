library(ziphsmm)


### Name: fasthmmfit.cont
### Title: Fast gradient descent algorithm to learn the parameters in a
###   specialized continuous-time zero-inflated hidden Markov model, where
###   zero-inflation only happens in State 1. And if there were covariates,
###   they could only be the same ones for the state-dependent log Poisson
###   means and the logit structural zero proportion.
### Aliases: fasthmmfit.cont

### ** Examples

priorparm <- 0
tpmparm <- c(-1,-2)
zeroindex <- c(1,0)
zeroparm <- c(0,-1,1)
emitparm <- c(2,0.5,-0.5,3,0.3,-0.2)
workparm <- c(priorparm,tpmparm,zeroparm,emitparm)
timeindex <- rep(1,1000)
for(i in 2:1000) timeindex[i] <- timeindex[i-1] + sample(1:4,1)

designx <- matrix(rnorm(2000),nrow=1000,ncol=2)
result <- hmmsim2.cont(workparm,2,1000,zeroindex,emit_x=designx,
                      zeroinfl_x=designx,timeindex=timeindex)
y <- result$series
state <- result$state

fit2 <-  fasthmmfit.cont(y=y,x=designx,M=2,prior_init=c(0.5,0.5),
  tpm_init=matrix(c(-0.2,0.2,0.1,-0.1),2,2,byrow=TRUE),
  zero_init=0.4,emit_init=c(7,21), timeindex=timeindex,
  hessian=FALSE, method="BFGS", control=list(trace=1))



