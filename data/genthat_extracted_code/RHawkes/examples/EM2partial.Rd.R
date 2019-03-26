library(RHawkes)


### Name: EM2partial
### Title: Partial EM algorithm for the RHawkes process, version 2
### Aliases: EM2partial
### Keywords: RHawkes EM algorithm

### ** Examples

## No test: 
## simulate data
set.seed(1)
tms <- simRHawkes(cens=10)
## the slower version of the EM algorithms on simulated data with
## default immigrant hazard function and offspring density
system.time( est2 <- EM2partial(tms=tms, cens=50, pars=c(1,1,0.5,1)) )
## End(No test)



