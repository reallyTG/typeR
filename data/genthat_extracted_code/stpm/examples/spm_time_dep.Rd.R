library(stpm)


### Name: spm_time_dep
### Title: A function for the model with time-dependent model parameters.
### Aliases: spm_time_dep

### ** Examples

library(stpm)
#Data preparation:
n <- 5
data <- simdata_time_dep(N=n)
# Estimation:
opt.par <- spm_time_dep(data)
opt.par



