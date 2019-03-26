library(ctmm)


### Name: plot.variogram
### Title: Plotting methods for variogram objects.
### Aliases: plot.variogram zoom,variogram-method

### ** Examples

# Load package and data
library(ctmm)
data(buffalo)

# Extract movement data for a single animal
Cilla <- buffalo$Cilla

# Calculate variogram
SVF <- variogram(Cilla)

# Plot the variogram
plot(SVF)



