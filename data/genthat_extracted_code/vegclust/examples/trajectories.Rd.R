library(vegclust)


### Name: trajectories
### Title: Community trajectory analysis
### Aliases: trajectories segmentDistances trajectoryDistances
###   trajectoryLengths trajectoryAngles trajectoryPCoA
###   trajectoryProjection trajectoryConvergence trajectoryDirectionality
###   centerTrajectories trajectoryDistances trajectoryLengths
###   trajectoryAngles trajectoryPCoA trajectoryPlot trajectoryProjection
###   trajectoryConvergence trajectoryDirectionality centerTrajectories

### ** Examples

  #Description of sites and surveys
  sites = c(1,1,1,2,2,2)
  surveys=c(1,2,3,1,2,3)
  
  #Raw data table
  xy<-matrix(0, nrow=6, ncol=2)
  xy[2,2]<-1
  xy[3,2]<-2
  xy[4:6,1] <- 0.5
  xy[4:6,2] <- xy[1:3,2]
  xy[6,1]<-1
  
  #Distance matrix
  d = dist(xy)
  d
  
  trajectoryLengths(d, sites, surveys)
  trajectoryAngles(d, sites, surveys)
  segmentDistances(d, sites, surveys)$Dseg
  trajectoryDistances(d, sites, surveys, distance.type = "Hausdorff")
  trajectoryDistances(d, sites, surveys, distance.type = "DSPD")
  
  #Draw trajectories
  trajectoryPCoA(d, sites, traj.colors = c("black","red"), lwd = 2)
  
  
  #Should give the same results if surveys are not in order 
  #(here we switch surveys for site 2)
  temp = xy[5,]
  xy[5,] = xy[6,]
  xy[6,] = temp
  surveys[5] = 3
  surveys[6] = 2
  trajectoryLengths(dist(xy), sites, surveys)
  segmentDistances(dist(xy), sites, surveys)$Dseg
  trajectoryDistances(dist(xy), sites, surveys, distance.type = "Hausdorff")
  trajectoryDistances(dist(xy), sites, surveys, distance.type = "DSPD")
 



