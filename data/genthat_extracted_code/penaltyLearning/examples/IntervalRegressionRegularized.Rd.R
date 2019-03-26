library(penaltyLearning)


### Name: IntervalRegressionRegularized
### Title: IntervalRegressionRegularized
### Aliases: IntervalRegressionRegularized

### ** Examples


if(interactive()){
  library(penaltyLearning)
  data("neuroblastomaProcessed", package="penaltyLearning", envir=environment())
  i.train <- 1:500
  fit <- with(neuroblastomaProcessed, IntervalRegressionRegularized(
    feature.mat[i.train,], target.mat[i.train,]))
  plot(fit)
}




