library(VoxR)


### Name: raster.proj
### Title: Create a raster image from project, level and surface
### Aliases: raster.proj
### Keywords: raster ploting

### ** Examples

data(treecloud_vox)

#- projection in xy plan

proj <- project(treecloud_vox,dim="xy")

#-computing parameters for levels and surf

nvox <- c(proj[,3])
lev_vox <- level(nvox,by="quantiles",levels=c(0.2))
surf_nvox <- surface(proj,method="nvox",levels=lev_vox,res=0.02,proportion=TRUE) 

#- drawing raster

par(mfrow=c(1,1),mai=c(1,0,1,0),omi=c(0,1,0,0))

raster.proj(proj,title="nvox",res=0.02,method="nvox",levels=lev_vox,
			colors=c("lightblue","green","yellow","red","purple"),
			contour=TRUE,surf=surf_nvox,dim="xy")



