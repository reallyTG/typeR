library(mcen)


### Name: cluster.vals
### Title: Returns the cluster values from a cv.mcen object.
### Aliases: cluster.vals

### ** Examples

## No test: 
x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
mcen_fit <- cv.mcen(x,y,ky=2,gamma_y=3)
mcen_cluster <- cluster.vals(mcen_fit)
## End(No test)



