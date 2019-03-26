library(alphahull)


### Name: ahull
### Title: alpha-convex hull calculation
### Aliases: ahull
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Random sample in the unit square
##D x <- matrix(runif(100), nc = 2)
##D # Value of alpha
##D alpha <- 0.2
##D # Alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D plot(ahull.obj)
##D 
##D # Uniform sample of size n=300 in the annulus B(c,0.5)\B(c,0.25), 
##D # with c=(0.5,0.5). 
##D n <- 300
##D theta<-runif(n,0,2*pi)
##D r<-sqrt(runif(n,0.25^2,0.5^2))
##D x<-cbind(0.5+r*cos(theta),0.5+r*sin(theta))
##D # Value of alpha
##D alpha <- 0.1
##D # Alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D # The arcs defining the boundary of the alpha-convex hull are ordered
##D plot(x)
##D for (i in 1:dim(ahull.obj$arcs)[1]){
##D arc(ahull.obj$arcs[i,1:2],ahull.obj$arcs[i,3],ahull.obj$arcs[i,4:5],
##D ahull.obj$arcs[i,6],col=2)
##D Sys.sleep(0.5)
##D }
##D 
##D # Random sample  from a uniform distribution on a Koch snowflake 
##D # with initial side length 1 and 3 iterations
##D x <- rkoch(2000, side = 1, niter = 3)
##D # Value of alpha
##D alpha <- 0.05
##D # Alpha-convex hull
##D ahull.obj <- ahull(x, alpha = alpha)
##D plot(ahull.obj)
## End(Not run)



