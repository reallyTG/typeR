library(opentraj)


### Name: PlotTrajFreq
### Title: Plot Trajectory Frequency
### Aliases: PlotTrajFreq
### Keywords: Air Trajectory Trajectory Frequency

### ** Examples

  library(raster)
    
  crs <- "+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0"
  air.traj.lines <- Df2SpLines(air.traj, crs)
  raster.lines <- RasterizeTraj(air.traj.lines, reduce=TRUE, resolution=15000, parallel=FALSE)
    
  r.max.value <- maxValue(raster.lines)
  v <- getValues(raster.lines)
  v <- v / r.max.value
  r <- setValues(raster.lines, v)
    
  ## convert raster object to SparialGridDataFrame Object
  r1 <- as(r, "SpatialGridDataFrame")
    
  PlotTrajFreq(r1, background = TRUE, main="Title", pdf=FALSE)



