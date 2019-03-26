library(LearnBayes)


### Name: gibbs
### Title: Metropolis within Gibbs sampling algorithm of a posterior
###   distribution
### Aliases: gibbs
### Keywords: models

### ** Examples

data=c(6,2,3,10)
start=array(c(1,1),c(1,2))
m=1000
scale=c(2,2)
s=gibbs(logctablepost,start,m,scale,data)



