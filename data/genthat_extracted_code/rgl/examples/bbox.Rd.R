library(rgl)


### Name: rgl.bbox
### Title: Set up Bounding Box decoration
### Aliases: rgl.bbox bbox3d
### Keywords: dynamic

### ** Examples

  rgl.open()
  rgl.points(rnorm(100), rnorm(100), rnorm(100))
  rgl.bbox(color = c("#333377", "white"), emission = "#333377", 
           specular = "#3333FF", shininess = 5, alpha = 0.8 )
  
  open3d()
  points3d(rnorm(100), rnorm(100), rnorm(100))
  bbox3d(color = c("#333377", "black"), emission = "#333377", 
         specular = "#3333FF", shininess = 5, alpha = 0.8)



