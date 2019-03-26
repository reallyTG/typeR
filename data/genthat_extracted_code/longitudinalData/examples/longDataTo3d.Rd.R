library(longitudinalData)


### Name: longDataTo3d
### Title: ~ Function: longDataTo3d ~
### Aliases: longDataTo3d
### Keywords: package cluster methods

### ** Examples

### Creation of single variable-trajectory
mat <- matrix(c(1,NA,3,2,3,6,1,8,10,1,NA,1,2,NA,3,2,3,2),6,3)
(ldSingle <- longData(mat))

### Extension to joint trajectories
(ldHyp <- longDataTo3d(ldSingle))



