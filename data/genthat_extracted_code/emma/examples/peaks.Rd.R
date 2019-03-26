library(emma)


### Name: peaks
### Title: Test problem with multiple peaks
### Aliases: peaks
### Keywords: ~Optimization

### ** Examples

x1 <- seq(-3, 3, length = 50)
x2 <- x1

x<-expand.grid(x1, x2)

z <- matrix(peaks(x), nrow = length(x1))

nrz <- nrow(z)
ncz <- ncol(z)
jet.colors <- colorRampPalette( c("red", "yellow") ) 
nbcol <- 100
color <- jet.colors(nbcol)
zfacet <- z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz]
facetcol <- cut(zfacet, nbcol)

persp(x1, x2, z, col = color[facetcol], theta = 0, phi = 10, 
	expand = 1, xlab = "x1", ylab = "x2", zlab = "f(x1, x2)", 
	ticktype = "detailed")



