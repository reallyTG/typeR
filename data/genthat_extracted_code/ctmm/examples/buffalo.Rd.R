library(ctmm)


### Name: buffalo
### Title: African buffalo GPS dataset from Kruger National Park, South
###   Africa.
### Aliases: buffalo
### Keywords: datasets

### ** Examples

# Load package and data
library(ctmm)
data("buffalo")

# Extract movement data for a single animal
Cilla <- buffalo$Cilla

# Plot all sampled locations
plot(Cilla)



