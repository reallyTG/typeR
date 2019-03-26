library(AIG)


### Name: spatial3d
### Title: Spatial 3D Reasoning Item
### Aliases: spatial3d

### ** Examples

item <- spatial3d(seed=4, angle=pi/1.3, x=0.3,y=4,z=0.8,cubes=8,axis = TRUE)

# To save the figure (not run)
# library(rgl)
# item <- spatial3d(seed=4, angle=pi/1.3, x=0.3,y=4,z=0.8,cubes=8,axis = TRUE)

# save in pdf
# wd<- '~/desktop'
# item <- 1

# save <- paste0(wd,"/display3d_",item,".pdf")
# rgl.postscript(save,"pdf")

# save in png
# rgl.snapshot(filename="image3D.png",fmt="png")



