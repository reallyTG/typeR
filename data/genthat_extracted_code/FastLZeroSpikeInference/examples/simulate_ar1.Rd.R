library(FastLZeroSpikeInference)


### Name: simulate_ar1
### Title: Simulate fluorescence trace based on simple AR(1) generative
###   model
### Aliases: simulate_ar1

### ** Examples

sim <- simulate_ar1(n = 500, gam = 0.998, poisMean = 0.009, sd = 0.05, seed = 1)
plot(sim)



