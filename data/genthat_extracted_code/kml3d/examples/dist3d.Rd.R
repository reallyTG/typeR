library(kml3d)


### Name: dist3d
### Title: ~ Function: dist3d ~
### Aliases: dist3d

### ** Examples

  ### Generate artificial data
  myCld <- gald3d()

  ### Distance between individual 1 and 3 (there are in the same group)
  dist3d(myCld['traj'][1,,],myCld['traj'][3,,])

  ### Distance between individual 1 and 51 (there are in two different groups)
  dist3d(myCld['traj'][1,,],myCld['traj'][51,,])



