library(deldir)


### Name: tile.list
### Title: Create a list of tiles in a tessellation
### Aliases: tile.list
### Keywords: spatial

### ** Examples

	x <- runif(20)
	y <- runif(20)
	z <- deldir(x,y)
	w <- tile.list(z)

	z <- deldir(x,y,rw=c(0,1,0,1))
	w <- tile.list(z)

	z <- deldir(x,y,rw=c(0,1,0,1),dpl=list(ndx=2,ndy=2))
	w <- tile.list(z)




