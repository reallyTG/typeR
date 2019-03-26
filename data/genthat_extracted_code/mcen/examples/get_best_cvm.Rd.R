library(mcen)


### Name: get_best_cvm
### Title: Gets the index position for the model with the smallest
###   cross-validation error.
### Aliases: get_best_cvm

### ** Examples

## No test: 
x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
mcen_fit <- cv.mcen(x,y,ky=2,gamma_y=3)
get_best_cvm(mcen_fit)
## End(No test)



