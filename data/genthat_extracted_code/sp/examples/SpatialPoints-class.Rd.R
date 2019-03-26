library(sp)


### Name: SpatialPoints-class
### Title: Class "SpatialPoints"
### Aliases: SpatialPoints-class [,SpatialPoints-method
###   coerce,SpatialPoints,matrix-method
###   coerce,SpatialPoints,data.frame-method
###   coerce,SpatialPoints,SpatialPixels-method
###   coerce,SpatialPoints,Line-method coerce,SpatialPoints,Lines-method
###   coerce,SpatialPoints,SpatialLines-method
###   coerce,SpatialPointsDataFrame,SpatialPixelsDataFrame-method
###   show,SpatialPoints-method as.data.frame.SpatialPoints
###   plot,SpatialPoints,missing-method summary,SpatialPoints-method
###   print.SpatialPoints summary.SpatialPoints rbind.SpatialPoints
###   $,SpatialPoints-method $<-,SpatialPoints,character-method
###   row.names.SpatialPoints coerce,ppp,SpatialPoints-method
### Keywords: classes

### ** Examples

x = c(1,2,3,4,5)
y = c(3,2,5,1,4)
S <- SpatialPoints(cbind(x,y))
S <- SpatialPoints(list(x,y))
S <- SpatialPoints(data.frame(x,y))
S
plot(S)



