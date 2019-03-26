library(opentraj)


### Name: RasterizeTraj
### Title: Rasterize Trajectory
### Aliases: RasterizeTraj
### Keywords: Raster Frequency

### ** Examples
  
 crs <- "+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0"
 air.traj.lines <- Df2SpLines(air.traj, crs)
 raster.lines <- RasterizeTraj(air.traj.lines, reduce=TRUE, resolution=10000, parallel=FALSE)



