library(AIG)


### Name: spatial3d_mirror
### Title: Mirror Spatial 3D Reasoning Item
### Aliases: spatial3d_mirror

### ** Examples

display <- spatial3d(seed=4, angle=pi/1.3, x=0.3,y=4,z=0.8, cubes=9, axis = TRUE)
display_mirror <- spatial3d_mirror(display, angle=pi/1.3, x=0.3,y=4,z=0.8, cubes=9, axis = TRUE)

# To save the figure (not run)
# library(rgl)
# display_mirror <- spatial3d_mirror(display, angle=pi/1.3, x=0.3,y=4,z=0.8, cubes=9, axis = TRUE)
# wd<- '~/desktop'

# save in pdf
# item <- 1
# rgl.postscript(save,"pdf")

# save in png
# rgl.snapshot(filename="image3D.png",fmt="png")




