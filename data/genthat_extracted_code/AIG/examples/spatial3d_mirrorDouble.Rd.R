library(AIG)


### Name: spatial3d_mirrorDouble
### Title: Mirror Spatial 3D Reasoning Item (2)
### Aliases: spatial3d_mirrorDouble

### ** Examples

display <- spatial3dDouble(seed=4, angle=pi/1.3, x=0.3,y=4,z=0.8,cubes=8, axis = TRUE)
display_mirror <- spatial3d_mirrorDouble(display, angle=pi/1.3, x=0.3, y=4, z=0.8,
                                         method="one", axis = TRUE)

# To save the figure (not run)
# library(rgl)
# display_mirror <- spatial3d_mirrorDouble(display, angle=pi/1.3, x=0.3, y=4, z=0.8,
#                                           method="one", axis = TRUE)
# wd<- '~/desktop'

# save in pdf
# item <- 1
# save <- paste0(wd,"/mirror3d_",item,".pdf")
# rgl.postscript(save,"pdf")

# save in png
# rgl.snapshot(filename="image3D.png",fmt="png")




