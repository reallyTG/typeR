library(FastLZeroSpikeInference)


### Name: estimate_spike_paths
### Title: Estimate spike train, underlying calcium concentration, and
###   changepoints based on a fluorescence trace. Automatic tuning
###   parameter selection within a range of values [lambda_min, lambda_max]
### Aliases: estimate_spike_paths

### ** Examples


sim <- simulate_ar1(n = 500, gam = 0.95, poisMean = 0.009, sd = 0.05, seed = 1)
plot(sim)

## Fits for tuning parameters between [0.1, 10]
fits <- estimate_spike_paths(dat = sim$fl, gam = 0.95, lambda_min = 0.1, lambda_max = 10)
print(fits)
plot(fits)
print(fits$path_fits[[1]])
plot(fits$path_fits[[1]])

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




