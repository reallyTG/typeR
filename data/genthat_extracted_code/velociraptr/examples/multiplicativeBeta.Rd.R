library(velociraptr)


### Name: multiplicativeBeta
### Title: Multiplicative Diversity Partitioning
### Aliases: completeTurnovers multiplicativeBeta
###   multiplicativeBeta,completeTurnovers,notEndemic notEndemic

### ** Examples

# Download a test dataset of pleistocene bivalves from the Paleobiology Database.
# DataPBDB<-downloadPBDB(Taxa="Bivalvia","Pleistocene","Pleistocene")

# Create a community matrix with tectonic plates as "samples".
# CommunityMatrix<-abundanceMatrix(DataPBDB,"geoplate")

# "True local diversity ratio"
# multiplicativeBeta(CommunityMatrix)

# Whittaker's effective species turnover
# completeTurnovers(CommunityMatrix)

# Proportional effective species turnover
# notEndemic(CommunityMatrix)




