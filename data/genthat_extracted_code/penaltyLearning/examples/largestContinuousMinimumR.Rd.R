library(penaltyLearning)


### Name: largestContinuousMinimumR
### Title: largestContinuousMinimumR
### Aliases: largestContinuousMinimumR

### ** Examples


library(penaltyLearning)
data(neuroblastomaProcessed, envir=environment())
one.problem.error <-
  neuroblastomaProcessed$errors[profile.id=="4" & chromosome=="1"]
indices <- one.problem.error[, largestContinuousMinimumR(
  errors, max.log.lambda-min.log.lambda)]
one.problem.error[indices[["start"]]:indices[["end"]],]




