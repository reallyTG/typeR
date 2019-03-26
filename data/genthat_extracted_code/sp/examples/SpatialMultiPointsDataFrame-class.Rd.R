library(sp)


### Name: SpatialMultiPointsDataFrame-class
### Title: Class "SpatialMultiPointsDataFrame"
### Aliases: SpatialMultiPointsDataFrame-class
###   [,SpatialMultiPointsDataFrame-method
###   coerce,SpatialMultiPointsDataFrame,data.frame-method
###   coerce,SpatialMultiPointsDataFrame,SpatialPointsDataFrame-method
###   show,SpatialMultiPointsDataFrame-method
###   points,SpatialMultiPointsDataFrame-method
###   coordinates,SpatialMultiPointsDataFrame-method
###   as.data.frame.SpatialMultiPointsDataFrame
###   dim.SpatialMultiPointsDataFrame print.SpatialMultiPointsDataFrame
###   rbind.SpatialMultiPointsDataFrame
###   row.names.SpatialMultiPointsDataFrame
### Keywords: classes

### ** Examples

# create three sets of points:
cl1 = cbind(rnorm(3, 10), rnorm(3, 10))
cl2 = cbind(rnorm(5, 10), rnorm(5,  0))
cl3 = cbind(rnorm(7,  0), rnorm(7, 10))

mpdf = SpatialMultiPointsDataFrame(list(cl1, cl2, cl3), data.frame(a = 1:3))
mpdf

plot(mpdf, col = mpdf$a, cex = 1:3)
as(mpdf, "data.frame")
mpdf[1:2,]




