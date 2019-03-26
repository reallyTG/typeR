library(MSEtool)


### Name: plot_betavar
### Title: Plots a beta variable
### Aliases: plot_betavar

### ** Examples

mu <- 0.5
stddev <- 0.1
plot_betavar(mu, stddev) # mean of plot should be 0.5

#logit parameters
mu <- 0
stddev <- 0.1
plot_betavar(mu, stddev, is_logit = TRUE) # mean of plot should be 0.5



