library(icosa)


### Name: translate
### Title: Translating the grid object in 3d Cartesian space
### Aliases: translate translate,hexagrid,numeric-method
###   translate,trigrid,numeric-method

### ** Examples

 # create a grid and plot it
g <- trigrid(3)
lines3d(g)
# translate the grid to (15000,15000,15000)
 g2 <- translate(g, c(15000,15000,15000))
	 lines3d(g2)




