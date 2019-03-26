library(flam)


### Name: plot.flam
### Title: Plots Function Estimates for Fit of Class "flam"
### Aliases: plot.flam

### ** Examples

#See ?'flam-package' for a full example of how to use this package

#generate data
set.seed(1)
data <- sim.data(n = 50, scenario = 1, zerof = 10, noise = 1)
#fit model for a range of tuning parameters
flam.out <- flam(x = data$x, y = data$y, alpha.seq = c(0.8, 0.9, 1))

#we plot the predictor fits for a specific index, e.g. 25
#that is, lambda and alpha of
flam.out$all.lambda[25]; flam.out$all.alpha[25]
plot(flam.out, index = 25)
#the fit only has 5 non-sparse features

#by default, up to 10 non-sparse features with the largest L2 norms are 
#plotted, but we can plot a different number of features if desired
plot(flam.out, index = 40, n.plot = 12)
#or we can plot specific predictors of interest
plot(flam.out, index = 40, predictor.indicators = c(1:4, 6, 8, 11, 12))



