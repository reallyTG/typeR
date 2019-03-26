library(mineCitrus)


### Name: sortmat
### Title: Reorders to rows (corresponding to different clusters) of a
###   matrix of medians to a desired order
### Aliases: sortmat

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
medians<-clustermeds(citrus.foldFeatureSet=citrus.foldFeatureSet,
                     citrus.foldClustering=citrus.foldClustering,
                     medsofinterest=c("Red","Blue"),
                     citrus.combinedFCSSet=citrus.combinedFCSSet)
names<-rownames(medians)
names<-names[c(31,1:30)]
sortedmedians<-sortmat(mat=medians,desiredorder=names)



