library(VoxR)


### Name: surface
### Title: Compute the surface of density classes of a projection
### Aliases: surface
### Keywords: pixels pixels surface

### ** Examples

#- projection

data(treecloud_vox)
proj <- project(treecloud_vox,dim="xy")

#- creating vectors with interests variables

npts <- c(proj[,4])
nvox <- c(proj[,3])
ratio <- c(proj[,5])

#-creating level of discretisation

lev_vox <- level(nvox,by="quantiles",levels=c(0.2))
lev_pts <- level(npts,by="percents",levels=c(0.2,0.4,0.6,0.8))
lev_ratio <- c(1,2)# <- level(ratio,by="quantiles",level=c(0.25))

#- computing surfaces

surf_nvox <- surface(proj,method="nvox",levels=lev_vox,res=0.02,proportion=TRUE) 
surf_npts <- surface(proj,method="npts",levels=lev_pts,res=0.02,proportion=FALSE) 
surf_ratio <- surface(proj,method="ratio",levels=lev_ratio,res=1,proportion=FALSE) 
surf_nvox
surf_npts
surf_ratio



