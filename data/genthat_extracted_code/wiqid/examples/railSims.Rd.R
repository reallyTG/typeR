library(wiqid)


### Name: railSims
### Title: Simulated detection/non-detection data for two species of rails
### Aliases: railSims
### Keywords: datasets

### ** Examples

data(railSims)
# Separate the two detection histories
DHA <- railSims[, 1:3]
DHB <- railSims[, 4:6]

# Default model (no interaction)
occ2sps(DHA, DHB)

## No test: 
# Model with full interaction
occ2sps(DHA, DHB, list(psiBA ~ 1, rA ~ 1, rBa ~ 1, rBA ~ 1))

# Model corresponding to the data generation model
occ2sps(DHA, DHB, list(psiA ~ logArea, psiBA ~ reeds, rBA ~ 1), data=railSims)
## End(No test)



