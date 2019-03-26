library(VoxR)


### Name: level
### Title: Density levels definition
### Aliases: level
### Keywords: variable discretisation quantiles percentages

### ** Examples

#- projection

data(treecloud_vox)
proj <- project(treecloud_vox,dim="xy")
nvox <- c(proj[,3])
npts <- c(proj[,4])
ratio <- c(proj[,5])

#- computing discretisation level

  #- number of voxels by quantiles
lev_vox <- level(nvox,by="quantiles",levels=c(0.2))
  #-number of points by percents
lev_pts <- level(npts,by="percents",levels=c(0.2,0.4,0.6,0.8))
  #-ration npts/nvox by quantiles
lev_ratio <- level(ratio,by="quantiles",levels=c(0.25)) 

#- to see the levels

lev_vox
lev_pts
lev_ratio 



