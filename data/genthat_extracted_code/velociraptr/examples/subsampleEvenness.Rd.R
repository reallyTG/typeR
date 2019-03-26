library(velociraptr)


### Name: subsampleEvenness
### Title: Shareholder Quorum Subsampling
### Aliases: subsampleEvenness

### ** Examples


# Download a test dataset of Miocene-Pleistocene bivalves.
# DataPBDB<-downloadPBDB(Taxa="Bivalvia",StartInterval="Miocene",StopInterval="Pleistocene")

 # Clean up the taxonomy by removing subgenus designation
 # DataPBDB<-cleanTaxonomy(DataPBDB,"genus")

# Create a community matrix of genera by tectonic plate ids.
# CommunityMatrix<-abundanceMatrix(DataPBDB,Rows="geoplate",Columns="genus")

# Cull out depauperate samples and rare taxa
# CommunityCull<-cullMatrix(CommunityMatrix,5,100)

# Calculate the standardized richness of each plate at a quota of 0.5.
# StandardizedRichness<-apply(CommunityCull,1,subsampleEvenness,0.5)




