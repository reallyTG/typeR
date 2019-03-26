library(sensors4plumes)


### Name: SpatialIndexDataFrame-class
### Title: Class "SpatialIndexDataFrame"
### Aliases: SpatialIndexDataFrame SpatialIndexDataFrame-class
###   SpatialIndexDataFrame-method
###   coerce,data.frame,SpatialIndexDataFrame-method
###   coordinates,SpatialIndexDataFrame-method
###   proj4string,SpatialIndexDataFrame-method
###   bbox,SpatialIndexDataFrame-method spplot,SpatialIndexDataFrame-method
###   length,SpatialIndexDataFrame-method cbind.SpatialIndexDataFrame
###   rbind.SpatialIndexDataFrame

### ** Examples

# generate SpatialIndexDataFrame from scratch
index = c(2,2,1,1,1,1,3,2,3,3,3,1)
SIndexDF1 = SpatialIndexDataFrame(index = as.integer(index), 
                          data = data.frame(a = c(1,2,4), 
                                            b = c(0.1, 0.2, 0.3), 
                                            c = c("A", "B", "A")))
# generate from data.frame
data(USArrests)
SIndexDF2 = as(USArrests,"SpatialIndexDataFrame")


# spplot
spplot(SIndexDF1, zcol = c("b", "c"), col.regions = grey.colors(10))

# cbind
SIndexDF3 = cbind(SIndexDF1, SIndexDF1)



