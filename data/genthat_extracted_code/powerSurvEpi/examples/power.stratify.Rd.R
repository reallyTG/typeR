library(powerSurvEpi)


### Name: power.stratify
### Title: Power Calculation for Survival Analysis with Binary Predictor
###   and Exponential Survival Function
### Aliases: power.stratify
### Keywords: survival

### ** Examples


# example on page 803 of Palta M and Amini SB. (1985). 
res.power <- power.stratify(
  n = 146, 
  timeUnit = 1.25, 
  gVec = c(0.5, 0.5),
  PVec = c(0.5, 0.5), 
  HR = 1 / 1.91, 
  lambda0Vec = c(2.303, 1.139),
  power.ini = 0.8, 
  power.low = 0.001, 
  power.upp = 0.999,
  alpha = 0.05, 
  verbose = TRUE
  )




