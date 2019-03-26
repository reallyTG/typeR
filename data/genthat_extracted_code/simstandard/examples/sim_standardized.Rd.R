library(simstandard)


### Name: sim_standardized
### Title: Generates simulated data with standardized parameters.
### Aliases: sim_standardized

### ** Examples

library(simstandard)
# Lavaan model
m = "Latent_1 =~ 0.8 * Ob_1 + 0.7 * Ob_2 + 0.4 * Ob_3"

# simulate 10 cases
sim_standardized(m, n = 10)



