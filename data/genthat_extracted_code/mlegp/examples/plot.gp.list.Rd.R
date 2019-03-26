library(mlegp)


### Name: plot.gp.list
### Title: Diagnostics Plots for Gaussian Process Lists
### Aliases: plot.gp.list
### Keywords: hplot methods

### ** Examples


## create data for multiple responses ##
x = seq(-5,5)
z1 = 10 - 5*x + rnorm(length(x))
z2 = 4 - 5*x + rnorm(length(x))
z3 = 7*sin(x) + rnorm(length(x))

## fit multiple Gaussian processes ##
fitMulti = mlegp(x, cbind(z1,z2,z3))

## plot diagnostics ##
plot(fitMulti)




