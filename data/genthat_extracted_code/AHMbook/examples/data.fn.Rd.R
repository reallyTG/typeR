library(AHMbook)


### Name: data.fn
### Title: Simulate data for binomial mixture model
### Aliases: data.fn

### ** Examples

# Generate a simulated data set with default arguments and look at the structure:
tmp <- data.fn()
str(tmp)

str(data.fn(J = 2))              # Only 2 surveys
str(data.fn(J = 1))              # No temporal replicate
str(data.fn(M = 1, J = 100))     # No spatial replicates, but 100 counts
str(data.fn(beta3 = 1))          # With interaction elev-wind on p
str(data.fn(M = 267, J = 3, mean.lambda = 2, beta1 = -2, beta2 = 2, beta3 = 1,
  mean.detection = 1))           # No obs. process (i.e., p = 1, perfect detection)
str(data.fn(mean.lambda = 50))   # Really common species
str(data.fn(mean.lambda = 0.05)) # Really rare species



