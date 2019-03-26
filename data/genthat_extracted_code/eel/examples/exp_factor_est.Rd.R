library(eel)


### Name: exp_factor_est
### Title: Calculating expansion factor for EEL for parameters defined by
###   estimating equations
### Aliases: exp_factor_est exp_factor_est.default
### Keywords: EEL

### ** Examples

#generate data with theoretical mean 2 and standard deviation 1
x=rnorm(100,2,1)
exp_factor_est(x=x, theta=2, equation="x-theta")



