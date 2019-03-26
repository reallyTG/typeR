library(ziphsmm)


### Name: hmmsmooth.cont2
### Title: Compute the posterior state probabilities for continuous-time
###   hidden Markov models where zero-inflation only happens in state 1 and
###   covariates can only be included in the state-dependent parameters
### Aliases: hmmsmooth.cont2

### ** Examples

set.seed(2910)
priorparm <- 0
tpmparm <- c(-1,-2)
zeroindex <- c(1,0)
zeroparm <- c(0,-1,1)
emitparm <- c(4,0.2,-0.2,5,0.1,-0.1)
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
  zero_init=0.4,emit_init=c(50,150), timeindex=timeindex,
  hessian=FALSE, method="BFGS", control=list(trace=1))
post <- hmmsmooth.cont2(y,designx,2,fit2$prior,fit2$tpm,fit2$zeroparm,
       fit2$emitparm,timeindex)




