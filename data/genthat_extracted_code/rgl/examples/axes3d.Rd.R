library(rgl)


### Name: axes3d
### Title: Draw boxes, axes and other text outside the data
### Aliases: axes3d axis3d mtext3d title3d box3d
### Keywords: dynamic

### ** Examples

  open3d()
  points3d(rnorm(10), rnorm(10), rnorm(10))

  # First add standard axes
  axes3d()  

  # and one in the middle (the NA will be ignored, a number would 
  # do as well)
  axis3d('x', pos = c(NA, 0, 0))

  # add titles
  title3d('main', 'sub', 'xlab', 'ylab', 'zlab')

  rgl.bringtotop()
  
  open3d()
  points3d(rnorm(10), rnorm(10), rnorm(10))
  
  # Use fixed axes
  
  axes3d(c('x', 'y', 'z'))
         
  # Put 4 x-axes on the plot
  axes3d(c('x--', 'x-+', 'x+-', 'x++'))         
  
  axis3d('x', pos = c(NA, 0, 0))     
  title3d('main', 'sub', 'xlab', 'ylab', 'zlab')



