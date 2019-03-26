library(LZeroSpikeInference)


### Name: simulateAR1
### Title: Simulate fluorescence trace based on simple AR(1) generative
###   model
### Aliases: simulateAR1

### ** Examples

sim <- simulateAR1(n = 500, gam = 0.998, poisMean = 0.009, sd = 0.05, seed = 1)
plot(sim)



