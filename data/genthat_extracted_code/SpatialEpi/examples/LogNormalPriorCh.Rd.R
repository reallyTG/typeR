library(SpatialEpi)


### Name: LogNormalPriorCh
### Title: Compute Parameters to Calibrate a Log-normal Distribution
### Aliases: LogNormalPriorCh
### Keywords: file

### ** Examples

# Calibrate the log-normal distribution s.t. the 95% confidence interval is [0.2, 5]
param <- LogNormalPriorCh(0.2, 5, 0.025, 0.975)
curve(dlnorm(x,param$mu,param$sigma), from=0, to=6, ylab="density")



