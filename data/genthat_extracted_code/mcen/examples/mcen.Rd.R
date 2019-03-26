library(mcen)


### Name: mcen
### Title: Fits an MCEN model
### Aliases: mcen

### ** Examples

x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
mcen_fit <- mcen(x,y,ky=2,delta=1)



