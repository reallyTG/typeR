library(velociraptr)


### Name: taxonAlpha
### Title: Additive Diversity Partitioning functions
### Aliases: meanAlpha sampleBeta taxonAlpha
###   taxonAlpha,meanAlpha,taxonBeta,sampleBeta,totalGamma taxonBeta
###   totalBeta totalGamma

### ** Examples

# Download a test dataset of pleistocene bivalves.
# DataPBDB<-downloadPBDB(Taxa="Bivalvia",StartInterval="Pleistocene",StopInterval="Pleistocene")

# Create a community matrix with tectonic plates as "samples"
# CommunityMatrix<-abundanceMatrix(DataPBDB,"geoplate")

# Calculate the average richness of all samples in a community.
# meanAlpha(CommunityMatrix)

# The beta diversity of all samples in a community.
# totalBeta(CommunityMatrix)

# This is, by definition, equivalent to the gamma diversity - mean alpha diversity.
# totalBeta(CommunityMatrix)==(totalGamma(CommunityMatrix)-meanAlpha(CommunityMatrix))




