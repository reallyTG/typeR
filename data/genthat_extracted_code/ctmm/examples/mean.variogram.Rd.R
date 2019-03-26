library(ctmm)


### Name: mean.variogram
### Title: Compute a number-weighted average of variogram objects
### Aliases: mean.variogram

### ** Examples
## No test: 
# Load package and data
library(ctmm)
data(buffalo)

# Calculate a list of variograms for all similar individuals in the dataset
# the 4th buffalo has a different sampling rate
SVFS <- lapply( buffalo[-4] , variogram )
# alternatively, we could variogram all at coarsest scale with variogram option dt

# Calculate the average variogram
SVF <- mean(SVFS)

# Plot the mean variogram
plot(SVF)
## End(No test)


