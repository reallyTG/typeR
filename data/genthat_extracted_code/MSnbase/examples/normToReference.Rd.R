library(MSnbase)


### Name: normToReference
### Title: Combine peptides into proteins.
### Aliases: normToReference NTR

### ** Examples

library("MSnbase")
data(msnset)

# choose the reference run automatically
combineFeatures(msnset, groupBy=fData(msnset)$ProteinAccession)

# use a user-given reference
combineFeatures(msnset, groupBy=fData(msnset)$ProteinAccession,
 reference=rep(2, 55))




