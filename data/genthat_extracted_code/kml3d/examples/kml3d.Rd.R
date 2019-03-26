library(kml3d)


### Name: kml3d
### Title: ~ Algorithm kml3d: K-means for Joint Longitidinal data ~
### Aliases: kml3d kml3d-method kml3d,ClusterLongData-method
### Keywords: dplot chron spatial classif cluster nonparametric ts robust

### ** Examples

## No test: 
### Generation of some data
cld1 <- generateArtificialLongData3d(15)

### We suspect 2, 3, 4 or 5 clusters, we want 3 redrawing.
###   We want to "see" what happen (so toPlot="both")
kml3d(cld1,2:5,3,toPlot="both")

### 3 seems to be the best.
###   We don't want to see again, we want to get the result as fast as possible.
###   Just, to check the overall process, we plot the criterion evolution
kml3d(cld1,3,10,toPlot="criterion")
## End(No test)



