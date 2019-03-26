library(sp)


### Name: SpatialGridDataFrame-class
### Title: Class "SpatialGridDataFrame"
### Aliases: SpatialGridDataFrame-class [,SpatialGridDataFrame-method
###   show,SpatialGridDataFrame-method cbind.SpatialGridDataFrame
###   plot.SpatialGridDataFrame print.summary.SpatialGridDataFrame
###   as.array.SpatialGridDataFrame
###   coerce,SpatialGridDataFrame,SpatialPointsDataFrame-method
###   coerce,SpatialGridDataFrame,SpatialPixelsDataFrame-method
###   coerce,SpatialGridDataFrame,SpatialPolygonsDataFrame-method
###   coerce,SpatialGridDataFrame,data.frame-method
###   coerce,SpatialGridDataFrame,matrix-method
###   coerce,SpatialGridDataFrame,array-method
###   as.data.frame.SpatialGridDataFrame dim.SpatialGridDataFrame
###   coerce,im,SpatialGridDataFrame-method
###   coerce,ppp,SpatialGridDataFrame-method
###   plot,SpatialGridDataFrame,missing-method
### Keywords: classes

### ** Examples

data(meuse.grid) # only the non-missing valued cells
coordinates(meuse.grid) = c("x", "y") # promote to SpatialPointsDataFrame
gridded(meuse.grid) <- TRUE # promote to SpatialPixelsDataFrame
x = as(meuse.grid, "SpatialGridDataFrame") # creates the full grid
x[["idist"]] = 1 - x[["dist"]] # assigns new attribute
image(x["idist"]) # note the single [ for attribute selection

# toy example:
df = data.frame(z = c(1:6,NA,8,9),
    xc = c(1,1,1,2,2,2,3,3,3),
    yc = c(rep(c(0, 1.5, 3),3)))
coordinates(df) = ~xc+yc
gridded(df) = TRUE
df = as(df, "SpatialGridDataFrame") # to full grid
image(df["z"])
# draw labels to verify:
cc = coordinates(df)
z=df[["z"]]
zc=as.character(z)
zc[is.na(zc)]="NA"
text(cc[,1],cc[,2],zc)

# the following is weird, but illustrates the concept of row/col selection:
fullgrid(meuse.grid) = TRUE
image(meuse.grid)
image(meuse.grid[20:70, 10:70, "dist"], add = TRUE, col = bpy.colors())

# as.matrix, as.array
sgdim = c(3,4)
SG = SpatialGrid(GridTopology(rep(0,2), rep(10,2), sgdim))
SGDF = SpatialGridDataFrame(SG, data.frame(val = 1:12))
as.array(SGDF)
as.matrix(SGDF)
as(SGDF, "array")



