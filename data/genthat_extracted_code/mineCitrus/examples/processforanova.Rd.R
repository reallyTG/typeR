library(mineCitrus)


### Name: processforanova
### Title: Processes cluster signaling data in form for statistical
###   analysis
### Aliases: processforanova

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
meds<-allmeds(citrus.combinedFCSSet=citrus.combinedFCSSet,
              citrus.foldClustering=citrus.foldClustering,
              citrus.foldFeatureSet=citrus.foldFeatureSet)
filteredmeds<-findclust(data=meds,clusters=c(19999,19972,19988))
foranova<-processforanova(filtereddata=filteredmeds)



