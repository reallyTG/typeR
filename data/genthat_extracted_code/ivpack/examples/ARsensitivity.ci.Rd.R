library(ivpack)


### Name: ARsensitivity.ci
### Title: ARsensitivity.ci
### Aliases: ARsensitivity.ci
### Keywords: ~kwd1 ~kwd2

### ** Examples

### a simulated data set
z = rnorm(100)
d = z+rnorm(100)
y = d+0.1*z+rnorm(100)
ivmodel = ivreg(y~d|z, x=TRUE)

### calculate confidence interval, given the allowance of sensitivity is (-0.1, 0.1)
ARsensitivity.ci(ivmodel, Delta=c(-0.1, 0.1))

### calculate confidence interval, assuming that IV is valid
ARsensitivity.ci(ivmodel)




