library(mineCitrus)


### Name: allmeds
### Title: Gets matrices of medians for each individual sample for all
###   measured parameters for all clusters
### Aliases: allmeds

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
meds<-allmeds(citrus.combinedFCSSet=citrus.combinedFCSSet,
              citrus.foldClustering=citrus.foldClustering,
              citrus.foldFeatureSet=citrus.foldFeatureSet)




