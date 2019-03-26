library(wiqid)


### Name: occ2sps
### Title: Single-season two-species occupancy estimation
### Aliases: occ2sps

### ** Examples

data(railSims)
# Extract the two detection histories
DHA <- railSims[, 1:3]
DHB <- railSims[, 4:6]

# Default model (no interaction)
occ2sps(DHA, DHB)

## No test: 
  
# Add a submodel for psiBA, so that psiBA and psiBa are separated:
occ2sps(DHA, DHB, model = psiBA ~ 1)

# Add covariates for psiA and psiBA; only display beta coefficients:
occ2sps(DHA, DHB, model = list(psiA ~ logArea, psiBA ~ reeds), data=railSims)$beta

# Model corresponding to the data generation model
occ2sps(DHA, DHB, list(psiA ~ logArea, psiBA ~ reeds, rBA ~ 1), data=railSims)$beta
## End(No test)



