library(mineCitrus)


### Name: filterMarker
### Title: Filters list of data matrices with columns corresponding to the
###   measured parameters of interest
### Aliases: filterMarker

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
meds<-allmeds(citrus.combinedFCSSet=citrus.combinedFCSSet,
              citrus.foldClustering=citrus.foldClustering,
              citrus.foldFeatureSet=citrus.foldFeatureSet)
meds2<-filterMarker(clustdat=meds,markers=c(2,3))



