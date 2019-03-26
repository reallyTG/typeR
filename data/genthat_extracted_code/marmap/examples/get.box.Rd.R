library(marmap)


### Name: get.box
### Title: Get bathymetric information of a belt transect
### Aliases: get.box

### ** Examples


# load and plot bathymetry
	data(hawaii)
	plot(hawaii,im=TRUE)

# get the depth matrix for a belt transect
	depth <- get.box(hawaii,x1=-157,y1=20,x2=-155.5,y2=21,width=0.5,col=2)
	
# plotting a 3D bathymetric map of the belt transect
	require(lattice)
	wireframe(depth,shade=TRUE)
	
# get the depth matrix for a belt transect with realistic aspect ratios
	depth <- get.box(hawaii,x1=-157,y1=20,x2=-155.5,y2=21,width=0.5,col=2,ratio=TRUE)

# plotting a 3D bathymetric map of the belt transect with realistic aspect ratios
	require(lattice)
	wireframe(depth[[1]],shade=TRUE,aspect=depth[[2]])



