library(mcen)


### Name: coef.cv.mcen
### Title: Returns the coefficients from the cv.mcen object with the
###   smallest cross-validation error.
### Aliases: coef.cv.mcen

### ** Examples

## No test: 
x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
mcen_fit <- cv.mcen(x,y,ky=2,gamma_y=3)
best_coef <- coefficients(mcen_fit)
## End(No test)



