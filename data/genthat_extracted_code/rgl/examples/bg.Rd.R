library(rgl)


### Name: bg3d
### Title: Set up Background
### Aliases: rgl.bg bg3d
### Keywords: dynamic

### ** Examples

  open3d()
  
  # a simple white background
  
  bg3d("white")

  # the holo-globe (inspired by star trek):

  bg3d(sphere = TRUE, color = c("black", "green"), lit = FALSE, back = "lines" )

  # an environmental sphere with a nice texture.

  bg3d(sphere = TRUE, texture = system.file("textures/sunsleep.png", package = "rgl"), 
         back = "filled" )
         
  # The same texture as a fixed background
  
  open3d()
  bg3d(texture = system.file("textures/sunsleep.png", package = "rgl"), col = "white")



