library(velociraptr)


### Name: abundanceMatrix
### Title: Create a community matrix of taxon abundances.
### Aliases: abundanceMatrix

### ** Examples


# Download a test dataset of pleistocene bivalves.
# DataPBDB<-downloadPBDB(Taxa="Bivalvia", StartInterval="Pleistocene", StopInterval="Pleistocene")

# Clean the genus column
# DataPBDB<-cleanTaxonomy(DataPBDB,"genus")

# Create a community matrix of genera by tectonic plate id#
# CommunityMatrix<-abundanceMatrix(Data=DataPBDB, Rows="geoplate", Columns="genus")




