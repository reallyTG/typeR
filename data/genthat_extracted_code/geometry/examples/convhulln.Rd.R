library(geometry)


### Name: convhulln
### Title: Compute smallest convex hull that encloses a set of points
### Aliases: convhulln
### Keywords: dplot graphs math

### ** Examples

# example convhulln
# ==> see also surf.tri to avoid unwanted messages printed to the console by qhull
ps <- matrix(rnorm(3000), ncol=3)  # generate points on a sphere
ps <- sqrt(3)*ps/drop(sqrt((ps^2) %*% rep(1, 3)))
ts.surf <- t(convhulln(ps))  # see the qhull documentations for the options
## Not run: 
##D rgl.triangles(ps[ts.surf,1],ps[ts.surf,2],ps[ts.surf,3],col="blue",alpha=.2)
##D for(i in 1:(8*360)) rgl.viewpoint(i/8)
## End(Not run)



