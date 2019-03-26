library(kml)


### Name: kml
### Title: ~ Algorithm kml: K-means for Longitidinal data ~
### Aliases: kml kml,ClusterLongData-method
### Keywords: dplot chron spatial classif cluster nonparametric ts robust

### ** Examples

## No test: 
### Generation of some data
cld1 <- generateArtificialLongData(25)

### We suspect 3, 4 or 6 clusters, we want 3 redrawing.
###   We want to "see" what happen (so printCal and printTraj are TRUE)
kml(cld1,c(3,4,6),3,toPlot='both')

### 4 seems to be the best. We want 7 more redrawing.
###   We don't want to see again, we want to get the result as fast as possible.
kml(cld1,4,10)
## End(No test)



