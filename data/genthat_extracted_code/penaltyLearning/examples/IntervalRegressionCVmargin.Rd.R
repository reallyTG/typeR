library(penaltyLearning)


### Name: IntervalRegressionCVmargin
### Title: IntervalRegressionCVmargin
### Aliases: IntervalRegressionCVmargin

### ** Examples

if(interactive()){
  library(penaltyLearning)
  data("neuroblastomaProcessed", package="penaltyLearning", envir=environment())
  if(require(future)){
    plan(multiprocess)
  }
  set.seed(1)
  fit <- with(neuroblastomaProcessed, IntervalRegressionCVmargin(
    feature.mat, target.mat, verbose=1))
  plot(fit)
  print(fit$plot.heatmap)
}



