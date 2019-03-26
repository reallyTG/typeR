library(LZeroSpikeInference)


### Name: estimateSpikes
### Title: Estimate spike train, underlying calcium concentration, and
###   changepoints based on fluorescence trace.
### Aliases: estimateSpikes

### ** Examples


sim <- simulateAR1(n = 500, gam = 0.998, poisMean = 0.009, sd = 0.05, seed = 1)
plot(sim)

# AR(1) model

fit <- estimateSpikes(sim$fl, gam = 0.998, lambda = 1, type = "ar1")
plot(fit)
print(fit)

# AR(1) + intercept model
fit <- estimateSpikes(sim$fl, gam = 0.998, lambda = 1, type = "intercept")
plot(fit)
print(fit)




