library(ThreeArmedTrials)


### Name: power_RET
### Title: Power related calcuations for three-arm clinical trials
### Aliases: power_RET
### Keywords: power samplesize waldtype

### ** Examples

power_RET(experiment = 15, reference = 17, placebo = 20,
         Delta = 0.8, sig_level = 0.025, power = 0.8,
         allocation = c(1, 1, 1) / 3,
         var_estimation = "RML",
         distribution = "poisson")



