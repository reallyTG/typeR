library(alphahull)


### Name: plot.ashape
### Title: Plot the alpha-shape
### Aliases: plot.ashape
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # Uniform sample of size n=300 in the annulus B(c, 0.5)\B(c, 0.25) 
##D # with c=(0.5, 0.5). 
##D n <- 300
##D theta<-runif(n,0,2*pi)
##D r<-sqrt(runif(n,0.25^2,0.5^2))
##D x<-cbind(0.5+r*cos(theta),0.5+r*sin(theta))
##D # Value of alpha
##D alpha <- 0.1
##D # alpha-shape 
##D ashape.obj <- ashape(x, alpha = alpha)
##D # Plot alpha-shape in blue, sample points in black, 
##D # and Delaunay triangulation in red
##D plot(ashape.obj, wlines= "del", col = c(4, 1, 2))
##D 
##D # Random sample  from a uniform distribution on a Koch snowflake 
##D # with initial side length 1 and 3 iterations
##D x <- rkoch(2000, side = 1, niter = 3)
##D # Value of alpha
##D alpha <- 0.05
##D # alpha-shape 
##D ashape.obj <- ashape(x, alpha = alpha)
##D # Plot alpha-shape in blue
##D plot(ashape.obj, col = c(4, 1))
## End(Not run)



