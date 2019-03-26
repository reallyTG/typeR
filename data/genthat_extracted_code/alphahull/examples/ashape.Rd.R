library(alphahull)


### Name: ashape
### Title: alpha-shape calculation
### Aliases: ashape
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Uniform sample of size n=300 in the annulus B(c,0.5)\B(c,0.25), 
##D # with c=(0.5,0.5). 
##D n <- 300
##D theta<-runif(n,0,2*pi)
##D r<-sqrt(runif(n,0.25^2,0.5^2))
##D x<-cbind(0.5+r*cos(theta),0.5+r*sin(theta))
##D # Value of alpha
##D alpha <- 0.1
##D # alpha-shape 
##D ashape.obj <- ashape(x, alpha = alpha)
##D # If we change the value of alpha there is no need to compute
##D # again the Delaunay triangulation and Voronoi Diagram
##D alpha <- 0.4
##D ashape.obj.new <- ashape(ashape.obj$delvor.obj, alpha = alpha)
##D 
##D # Random sample  from a uniform distribution on a Koch snowflake 
##D # with initial side length 1 and 3 iterations
##D x <- rkoch(2000, side = 1, niter = 3)
##D # Value of alpha
##D alpha <- 0.05
##D # alpha-shape 
##D ashape.obj <- ashape(x, alpha = alpha)
## End(Not run)



