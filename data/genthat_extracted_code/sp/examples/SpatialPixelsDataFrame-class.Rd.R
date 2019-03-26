library(sp)


### Name: SpatialPixelsDataFrame-class
### Title: Class "SpatialPixelsDataFrame"
### Aliases: SpatialPixelsDataFrame-class [,SpatialPixelsDataFrame-method
###   show,SpatialPixelsDataFrame-method plot.SpatialPixelsDataFrame
###   print.summary.SpatialPixelsDataFrame
###   coerce,SpatialPixelsDataFrame,SpatialPointsDataFrame-method
###   coerce,SpatialPixelsDataFrame,SpatialGridDataFrame-method
###   coerce,SpatialPixelsDataFrame,SpatialPolygonsDataFrame-method
###   coerce,SpatialPixelsDataFrame,data.frame-method
###   coerce,SpatialPixelsDataFrame,matrix-method
###   coerce,SpatialPixelsDataFrame,array-method
###   as.data.frame.SpatialPixelsDataFrame rbind.SpatialPixelsDataFrame
###   dim.SpatialPixelsDataFrame plot,SpatialPixelsDataFrame,missing-method
### Keywords: classes

### ** Examples

data(meuse.grid) # only the non-missing valued cells
coordinates(meuse.grid) = c("x", "y") # promote to SpatialPointsDataFrame
gridded(meuse.grid) <- TRUE # promote to SpatialPixelsDataFrame
meuse.grid[["idist"]] = 1 - meuse.grid[["dist"]] # assigns new attribute
image(meuse.grid["idist"]) # note the single [

# toy example:
df = data.frame(z = c(1:6,NA,8,9),
    xc = c(1,1,1,2,2,2,3,3,3),
    yc = c(rep(c(0, 1.5, 3),3)))
coordinates(df) = ~xc+yc
gridded(df) = TRUE
image(df["z"])
# draw labels to verify:
cc = coordinates(df)
z=df[["z"]]
zc=as.character(z)
zc[is.na(zc)]="NA"
text(cc[,1],cc[,2],zc)




