library(ziphsmm)


### Name: hmmsim3.cont
### Title: Simulate a continuous-time hidden Markov series and its
###   underlying states with covariates in state-dependent parameters and
###   transition rates.
### Aliases: hmmsim3.cont

### ** Examples

priorparm <- 0
tpmparm <- c(-2,0.1,-0.1,-2,0.2,-0.2)
zeroindex <- c(1,0)
zeroparm <- c(0,-1,1)
emitparm <- c(2,0.5,-0.5,3,0.3,-0.2)
workparm <- c(priorparm,tpmparm,zeroparm,emitparm)
timeindex <- rep(1,1000)
for(i in 2:1000) timeindex[i] <- timeindex[i-1] + sample(1:4,1)

designx <- matrix(rnorm(2000),nrow=1000,ncol=2)
result <- hmmsim3.cont(workparm,2,1000,zeroindex,x=designx,timeindex=timeindex)
y <- result$series
state <- result$state




