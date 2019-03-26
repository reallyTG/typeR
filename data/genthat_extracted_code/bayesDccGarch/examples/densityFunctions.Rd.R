library(bayesDccGarch)


### Name: densityFunctions
### Title: Density functions of multivariate Standard Skew Norm, t-Student
###   and GED distributions
### Aliases: dssnorm dsst dssged
### Keywords: distribution density-function multivariate-distribution
###   skew-distribution

### ** Examples

### Univariate symmetric standard norm distributions ###
dssnorm(x=0)
dsst(x=0, nu=100)
dssged(x=0, delta=2)

### Univariate standard skew norm distributions ###
dssnorm(x=0, gamma=1.5)
dsst(x=0, gamma=1.5, nu=100)
dssged(x=0, gamma=1.5, delta=2)

### Multivariate standard skew norm distributions ###
dssnorm(x=c(0,0), gamma=c(1.5,0.7))
dsst(x=c(0,0), gamma=c(1.5,0.7), nu=100)
dssged(x=c(0,0), gamma=c(1.5,0.7), delta=2)



