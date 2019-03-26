library(pssm)


### Name: pssm.generate.data
### Title: Generates data with a piecewise exponential proportional hazards
###   model for progression and surivival
### Aliases: pssm.generate.data
### Keywords: package survival interval censoring progression free survival

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
u=pssm.generate.data(theta1=.5,theta2=0,phaz.progression=rep(log(-log(.3)/4),5),	
phaz.survival=rep(log(-log(.2)/4),15),accrual=2,followup=2.9,m=5,n=300,times=c(.8,2.1,3.4))



