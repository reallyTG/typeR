library(opentraj)


### Name: SplitSpLines
### Title: Split Spatial Lines
### Aliases: SplitSpLines
### Keywords: Split SpatialLines

### ** Examples

## split the SpatialLines object in a list with 8 SpatialLines objects

crs <- "+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0"
air.traj.lines <- Df2SpLines(air.traj, crs)

lines.list <- SplitSpLines(air.traj.lines, 8)



