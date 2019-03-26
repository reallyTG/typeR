library(geoR)


### Name: polygrid
### Title: Coordinates of Points Inside a Polygon
### Aliases: polygrid
### Keywords: spatial

### ** Examples

 poly <- matrix(c(.2, .8, .7, .1, .2, .1, .2, .7, .7, .1), ncol=2)
 plot(0:1, 0:1, type="n")
 lines(poly)
 poly.in <- polygrid(seq(0,1,l=11), seq(0,1,l=11), poly, vec=TRUE)
 points(poly.in$xy)



