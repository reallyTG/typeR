library(surveillance)


### Name: algo.quality
### Title: Computation of Quality Values for a Surveillance System Result
### Aliases: algo.quality
### Keywords: misc

### ** Examples

# Create a test object
disProgObj <- sim.pointSource(p = 0.99, r = 0.5, length = 200, A = 1,
                              alpha = 1, beta = 0, phi = 0,
                              frequency = 1, state = NULL, K = 1.7)

# Let this object be tested from rki1
survResObj <- algo.rki1(disProgObj, control = list(range = 50:200))

# Compute the quality values
algo.quality(survResObj)



