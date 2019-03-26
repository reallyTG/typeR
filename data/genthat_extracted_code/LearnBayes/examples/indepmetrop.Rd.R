library(LearnBayes)


### Name: indepmetrop
### Title: Independence Metropolis independence chain of a posterior
###   distribution
### Aliases: indepmetrop
### Keywords: models

### ** Examples

data=c(6,2,3,10)
proposal=list(mu=array(c(2.3,-.1),c(2,1)),var=diag(c(1,1)))
start=array(c(0,0),c(1,2))
m=1000
fit=indepmetrop(logctablepost,proposal,start,m,data)



