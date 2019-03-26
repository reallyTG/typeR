library(LearnBayes)


### Name: rwmetrop
### Title: Random walk Metropolis algorithm of a posterior distribution
### Aliases: rwmetrop
### Keywords: models

### ** Examples

data=c(6,2,3,10)
varcov=diag(c(1,1))
proposal=list(var=varcov,scale=2)
start=array(c(1,1),c(1,2))
m=1000
s=rwmetrop(logctablepost,proposal,start,m,data)



