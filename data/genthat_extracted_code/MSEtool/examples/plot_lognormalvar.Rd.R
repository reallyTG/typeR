library(MSEtool)


### Name: plot_lognormalvar
### Title: Plots a lognormal variable
### Aliases: plot_lognormalvar

### ** Examples

mu <- 0.5
stddev <- 0.1
plot_lognormalvar(mu, stddev) # mean of plot should be 0.5

#logtransformed parameters
mu <- 0
stddev <- 0.1
plot_lognormalvar(mu, stddev, logtransform = TRUE) # mean of plot should be 1



