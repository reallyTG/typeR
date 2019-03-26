library(EnvStats)


### Name: boxcoxTransform
### Title: Apply a Box-Cox Power Transformation to a Set of Data
### Aliases: boxcoxTransform
### Keywords: univar models

### ** Examples

  # Generate 30 observations from a lognormal distribution with 
  # mean=10 and cv=2, then look at some normal quantile-quantile 
  # plots for various transformations.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  x <- rlnormAlt(30, mean = 10, cv = 2)

  dev.new() 
  qqPlot(x, add.line = TRUE)

  dev.new()
  qqPlot(boxcoxTransform(x, lambda = 0.5), add.line = TRUE) 

  dev.new()
  qqPlot(boxcoxTransform(x, lambda = 0), add.line = TRUE) 
  

  # Clean up
  #---------
  rm(x)



