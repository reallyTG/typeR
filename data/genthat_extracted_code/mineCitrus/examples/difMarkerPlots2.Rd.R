library(mineCitrus)


### Name: difMarkerPlots2
### Title: Plot dot plots of features where one cluster is significantly
###   different from the reference cluster without processing data before
###   hand
### Aliases: difMarkerPlots2

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
meds<-allmeds(citrus.combinedFCSSet=citrus.combinedFCSSet,
              citrus.foldClustering=citrus.foldClustering,
              citrus.foldFeatureSet=citrus.foldFeatureSet)
graphs<-difMarkerPlots2(data=meds,clusters=c(19999,19972,19988),markers=c(2,3),
                        diffclust=19999,strat=19999)



