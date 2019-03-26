library(mcen)


### Name: cv.mcen
### Title: Cross validation for mcen function
### Aliases: cv.mcen

### ** Examples

## No test: 
x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
cv_fit <- cv.mcen(x,y,ky=2)
## End(No test)



