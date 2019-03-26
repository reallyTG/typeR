library(penaltyLearning)


### Name: targetIntervals
### Title: Compute target intervals
### Aliases: targetIntervals

### ** Examples


library(penaltyLearning)
data(neuroblastomaProcessed, envir=environment())
targets.dt <- targetIntervals(
  neuroblastomaProcessed$errors,
  problem.vars=c("profile.id", "chromosome"))




