library(powerSurvEpi)


### Name: ssize.stratify
### Title: Sample size calculation for Survival Analysis with Binary
###   Predictor and Exponential Survival Function
### Aliases: ssize.stratify
### Keywords: survival

### ** Examples


# example on page 803 of Palta M and Amini SB. (1985). 
n <- ssize.stratify(
  power = 0.9, 
  timeUnit = 1.25, 
  gVec = c(0.5, 0.5),
  PVec = c(0.5, 0.5), 
  HR = 1 / 1.91, 
  lambda0Vec = c(2.303, 1.139),
  alpha = 0.05, 
  verbose = TRUE
)




