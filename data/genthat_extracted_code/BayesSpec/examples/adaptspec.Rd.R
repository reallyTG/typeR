library(BayesSpec)


### Name: adaptspec
### Title: Adaptive Spectral Estimation for Non-stationary Time Series
### Aliases: adaptspec

### ** Examples

#Running adaptspec with the simulated_piecewise data.
data(simulated_piecewise)
model1 <- adaptspec(nloop = 80, nwarmup = 20,
   nexp_max = 5, x = simulated_piecewise[1:100])
str(model1)
summary(model1$nexp_curr)
plot(model1$nexp_curr)




