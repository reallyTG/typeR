library(entropart)


### Name: SpeciesDistribution
### Title: Species Distributions.
### Aliases: SpeciesDistribution as.SpeciesDistribution
###   as.SpeciesDistribution.data.frame as.SpeciesDistribution.integer
###   as.SpeciesDistribution.numeric is.SpeciesDistribution
###   plot.SpeciesDistribution AbdVector as.AbdVector
###   as.AbdVector.data.frame as.AbdVector.integer as.AbdVector.numeric
###   is.AbdVector ProbaVector as.ProbaVector as.ProbaVector.data.frame
###   as.ProbaVector.integer as.ProbaVector.numeric is.ProbaVector

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Ns is the total number of trees per species
Ns <- as.AbdVector(Paracou618.MC$Ns)
# Whittaker plot, poorly fitted by a log-normal distribution
plot(Ns, Distribution = "lnorm")



