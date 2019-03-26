library(mineCitrus)


### Name: clustermeds
### Title: Gets matrix of medians for desired measured features for all
###   clusters meeting threshold requirements specified in Citrus
### Aliases: clustermeds

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
medians<-clustermeds(citrus.foldFeatureSet=citrus.foldFeatureSet,
                     citrus.foldClustering=citrus.foldClustering,
                     medsofinterest=c("Red","Blue"),
                     citrus.combinedFCSSet=citrus.combinedFCSSet)




