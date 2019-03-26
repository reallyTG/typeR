library(penaltyLearning)


### Name: largestContinuousMinimumC
### Title: largestContinuousMinimumC
### Aliases: largestContinuousMinimumC

### ** Examples


library(penaltyLearning)
data(neuroblastomaProcessed, envir=environment())
one.problem.error <-
  neuroblastomaProcessed$errors[profile.id=="4" & chromosome=="1"]
indices <- one.problem.error[, largestContinuousMinimumC(
  errors, max.log.lambda-min.log.lambda)]
one.problem.error[indices[["start"]]:indices[["end"]],]




