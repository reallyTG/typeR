library(netSEM)


### Name: subsetData
### Title: Subset of the result table
### Aliases: subsetData

### ** Examples

# Load acrylic data set
data(acrylic)
# Build a semi-gSEM model
ans <- netSEMm(acrylic)
# Subset dataset with different cutoff
res <- subsetData(ans,cutoff=c(0.2))
res <- subsetData(ans,cutoff=c(0.2,0.5))
res <- subsetData(ans,cutoff=c(0.2,0.5,0.8))




