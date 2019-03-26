library(FastLZeroSpikeInference)


### Name: estimate_spikes
### Title: Estimate spike train, underlying calcium concentration, and
###   changepoints based on a fluorescence trace.
### Aliases: estimate_spikes

### ** Examples


sim <- simulate_ar1(n = 500, gam = 0.95, poisMean = 0.009, sd = 0.05, seed = 1)
plot(sim)

## Fits for a single tuning parameter

# AR(1) model
fit <- estimate_spikes(dat = sim$fl, gam = 0.95, lambda = 1)
print(fit)

# compute fitted values from prev. fit
fit <- estimate_calcium(fit)
plot(fit)

# or
fit <- estimate_spikes(dat = sim$fl, gam = 0.95, lambda = 1, estimate_calcium = TRUE)
plot(fit)

# Constrained AR(1) model
fit <- estimate_spikes(dat = sim$fl, gam = 0.95, lambda = 1, constraint = TRUE,
                                                    estimate_calcium = TRUE)
print(fit)
plot(fit)




