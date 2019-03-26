library(opentraj)


### Name: Df2SpLines
### Title: Data Frame to Spatial Lines
### Aliases: Df2SpLines
### Keywords: Lines Trajectories

### ** Examples

  ## load data frame of HYSPLIT trajectory calculations calculated by function ProcTraj
  crs <- "+proj=longlat +datum=NAD83 +no_defs +ellps=GRS80 +towgs84=0,0,0"
  air.traj.lines <- Df2SpLines(air.traj, crs)
  PlotTraj(air.traj.lines)



