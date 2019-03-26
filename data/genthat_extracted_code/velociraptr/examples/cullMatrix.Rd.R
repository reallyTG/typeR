library(velociraptr)


### Name: cullMatrix
### Title: Cull rare taxa and depauperate samples
### Aliases: cullMatrix
###   cullMatrix,errorMatrix,culltaxa,cullSamples,occurrencesFlag,diversityFlag,softCull,softTaxa,softSamples

### ** Examples

# Download a test dataset of pleistocene bivalves.
# DataPBDB<-downloadPBDB(Taxa="Bivalvia",StartInterval="Pleistocene",StopInterval="Pleistocene")

# Create a community matrix with tectonic plates as "samples".
# CommunityMatrix<-abundanceMatrix(DataPBDB,"geoplate")

# Remove taxa that occur in less than 5 samples and samples with fewer than 25 taxa.
# cullMatrix(CommunityMatrix,Rarity=5,Richness=25,Silent=FALSE)




