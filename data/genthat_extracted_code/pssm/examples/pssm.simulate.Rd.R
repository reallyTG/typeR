library(pssm)


### Name: pssm.simulate
### Title: Simulates pssm analysis
### Aliases: pssm.simulate
### Keywords: package survival interval censoring progression free survival

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
#creates 1 simulations with 50 observations
pss=pssm.simulate(nruns=1,theta1=.2,theta2=.2,phaz.progression=log(-log(.3)/4)*rep(1,3),
  phaz.survival=log(-log(.15)/4)*rep(1,6),accrual=1,followup=2,,m=3,n=50,rescale=1)
#Summary of run 1
summary(pss$objects[[1]][[1]])



