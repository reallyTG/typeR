library(cheddar)


### Name: SiteBySpeciesMatrix
### Title: Community collection site by species matrix
### Aliases: SiteBySpeciesMatrix
### Keywords: utilities

### ** Examples

data(pHWebs)

# If abundance is NULL, you get a presence/absence matrix:
SiteBySpeciesMatrix(pHWebs)

# Numerical abundance
SiteBySpeciesMatrix(pHWebs, 'N')

# Biomass abundance
SiteBySpeciesMatrix(pHWebs, 'Biomass')

# Log10 biomass abundance
SiteBySpeciesMatrix(pHWebs, 'Log10Biomass')

# Example showing how to model biomass in term of pH using vegan's rda function
m <- SiteBySpeciesMatrix(pHWebs, 'Biomass')

# Some nodes (e.g. CPOM) do not have a biomass. The rows in m for these nodes 
# will contain all NA. Rows containing all NA will upset vegan's rda function 
# so these rows must be removed.
m <- m[apply(m, 1, function(row) all(!is.na(row))),]

# Tranpose to get row per site - the format required by vegan's rda function
m <- t(m)

# Matrix (with a row per site) of variables on the right hand side of the 
# model equation
variables <- CollectionCPS(pHWebs)

## Not run: library(vegan)
## Not run: res <- rda(m~pH,variables)



