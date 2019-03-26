library(velociraptr)


### Name: subsampleIndividuals
### Title: Iterative Rarefaction
### Aliases: subsampleIndividuals

### ** Examples


# Download a test dataset of Miocene-Pleistocene bivalves
# DataPBDB<-downloadPBDB(Taxa="Bivalvia",StartInterval="Miocene",StopInterval="Pleistocene")

 # Clean up the taxonomy by removing subgenus designation
 # DataPBDB<-cleanTaxonomy(DataPBDB,"genus")

# Create a community matrix of genera by tectonic plate ids
# CommunityMatrix<-abundanceMatrix(DataPBDB,Rows="geoplate",Columns="genus")

# Cull out depauperate samples and rare taxa
# CommunityCull<-cullMatrix(CommunityMatrix,5,100)

# Calculate the standardized richness of each plate assuming a fixed sample size of 100 occurrences
# StandardizedRichness<-apply(CommunityCull,1,subsampleIndividuals,100)




