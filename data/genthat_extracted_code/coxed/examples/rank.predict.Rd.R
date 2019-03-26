library(coxed)


### Name: rank.predict
### Title: Generate predicted ranks for new observations given a new
###   covariate profile
### Aliases: rank.predict

### ** Examples

estimationLPs <- rnorm(20)
cbind(estimationLPs, rank(estimationLPs))
newLPs <- rnorm(5)
newLP.rank <- rank.predict(x=newLPs, v=estimationLPs)
cbind(newLPs, newLP.rank)



