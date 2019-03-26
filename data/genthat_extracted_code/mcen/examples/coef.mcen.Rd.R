library(mcen)


### Name: coef.mcen
### Title: Returns the coefficients from an mcen object.
### Aliases: coef.mcen

### ** Examples

x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
mcen_fit <- mcen(x,y,ky=2,gamma_y=3,delta=c(1,2))
best_coef <- coefficients(mcen_fit,delta=1)



