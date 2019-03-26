library(mineCitrus)


### Name: posthoc
### Title: Runs ANOVA and t-tests comparing clusters and markers in
###   clusters
### Aliases: posthoc

### ** Examples

library(mineCitrus)
data("citrus.combinedFCSSet")
data("citrus.foldClustering")
data("citrus.foldFeatureSet")
meds<-allmeds(citrus.combinedFCSSet=citrus.combinedFCSSet,
              citrus.foldClustering=citrus.foldClustering,
              citrus.foldFeatureSet=citrus.foldFeatureSet)
filteredmeds<-findclust(data=meds,clusters=c(19999,19972,19988))
meds2<-filterMarker(clustdat=filteredmeds,markers=c(2,3))
foranova<-processforanova(filtereddata=meds2)
ttests<-posthoc(processedDat=foranova,clustIDdif=19999)



