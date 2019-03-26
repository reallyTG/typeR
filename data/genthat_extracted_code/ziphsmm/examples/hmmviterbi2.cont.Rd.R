library(ziphsmm)


### Name: hmmviterbi2.cont
### Title: Viterbi algorithm to decode the latent states in continuous-time
###   hidden Markov models with covariates
### Aliases: hmmviterbi2.cont

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
x <- cbind(1,designx) #has to make the additional 1st column of 1 for intercept
result <- hmmsim2.cont(workparm,2,1000,zeroindex,emit_x=designx,
                      zeroinfl_x=designx,timeindex=timeindex)
y <- result$series
state <- result$state

fit2 <-  fasthmmfit.cont(y=y,x=designx,M=2,prior_init=c(0.5,0.5),
  tpm_init=matrix(c(-0.2,0.2,0.1,-0.1),2,2,byrow=TRUE),
  zero_init=0.4,emit_init=c(7,21), timeindex=timeindex,
  hessian=FALSE, method="BFGS", control=list(trace=1))
decode2 <- hmmviterbi2.cont(y,2,fit2$working_parm,c(1,0),
  emit_x=designx, zeroinfl_x=designx,
  timeindex=timeindex,plot=FALSE)



