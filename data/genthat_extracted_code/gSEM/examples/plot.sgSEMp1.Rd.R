library(gSEM)


### Name: plot.sgSEMp1
### Title: Plotting of Principle 1 of Semi-gSEM
### Aliases: plot.sgSEMp1

### ** Examples

# Load acrylic data set
data(acrylic)
# Build a semi-gSEM model with principle 1
ans <- sgSEMp1(acrylic)
# Plot the network model with adjusted-R-squred of 0.1
plot(ans, cutoff = 0.1)



