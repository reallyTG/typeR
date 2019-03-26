library(opentraj)


### Name: Df2SpLinesDf
### Title: Data Frame to Spatial Lines Data Frame
### Aliases: Df2SpLinesDf
### Keywords: Lines Trajectories

### ** Examples

  crs <- "+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0"
  air.traj.lines <- Df2SpLines(air.traj, crs)
  air.traj.linesDf <- Df2SpLinesDf(air.traj.lines, air.traj)
  PlotTraj(air.traj.linesDf)



