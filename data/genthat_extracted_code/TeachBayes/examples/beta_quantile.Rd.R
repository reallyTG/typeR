library(TeachBayes)


### Name: beta_quantile
### Title: Displays a Quantile of a Beta Curve
### Aliases: beta_quantile

### ** Examples

  # find the .50 quantile (the median)
  prob <- 0.5
  parameters <- c(2, 5)
  beta_quantile(prob, parameters)
  # find the .90 quantile (90th percentile)
  prob <- 0.9
  beta_quantile(prob, parameters)



