library(MCMC4Extremes)


### Name: plot.ggevp
### Title: Plot Fitted for the Dual Gamma Generalized Extreme Value
###   Distribution (GGEV) Model
### Aliases: plot.ggevp

### ** Examples

# Obtaining posterior distribution of a vector of simulated points
w=rggev(300,0.4,10,5,0.5)

# Obtaning 300 points of posterior distribution with delta=0.5
fit=ggevp(w,1,200,0.5)
## Not run: plot(fit,"histogram")
plot(fit,"predictive")
## Not run: plot(fit,"retlevel", 10, 50)



