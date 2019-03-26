library(respirometry)


### Name: calc_b
### Title: Calculate the metabolic scaling coefficient, b
### Aliases: calc_b

### ** Examples

# Simple example
mass <- c(1, 10, 100, 1000, 40, 4, 400, 60, 2, 742, 266, 983) # made up values
MO2 <- mass ^ 0.65 + rnorm(n = length(mass)) # make up some data
calc_b(mass = mass, MO2 = MO2)

# How about some mass-specific MO2s?
msMO2 <- mass ^ -0.25 + rnorm(n = length(mass), sd = 0.05)
calc_b(mass = mass, MO2 = msMO2)
calc_b(mass = mass, MO2 = msMO2, plot = "log")




