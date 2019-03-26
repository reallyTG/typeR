library(vcdExtra)


### Name: split3d
### Title: Subdivide a 3D Object
### Aliases: split3d split3d.shape3d split3d.list range3d center3d
### Keywords: dplot

### ** Examples

if (require(rgl)) {
  open3d()
  cube <- cube3d(alpha=0.4)
  sl1 <- split3d(cube, c(.2, .3, .5), 1)
  col <- c("#FF000080", "#E5E5E580", "#0000FF80")
  shapelist3d(sl1, col=col)
	
  open3d()
  p <- matrix(c(.6, .4, .5, .5, .2, .8), nrow=2)
  sl2 <- split3d(sl1, p, 2)
  shapelist3d(sl2, col=col)	
  }



