library(mineCitrus)


### Name: classclustermeds
### Title: Gets matrices of medians for each individual sample for all
###   measured parameters for all clusters
### Aliases: classclustermeds

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
meds<-allmeds(citrus.combinedFCSSet=citrus.combinedFCSSet,
              citrus.foldClustering=citrus.foldClustering,
              citrus.foldFeatureSet=citrus.foldFeatureSet)
medians<-classclustermeds(citrus.foldFeatureSet,citrus.foldClustering,
                          citrus.combinedFCSSet,groupsizes=c(10,10),meds=meds)




