library(mcen)


### Name: predict.cv.mcen
### Title: Makes predictions from the model with the smallest
###   cross-validation error.
### Aliases: predict.cv.mcen

### ** Examples

## No test: 
x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
mcen_fit <- cv.mcen(x,y,ky=2,gamma_y=3)
new_x <- matrix(rnorm(12),ncol=4)
mcen_preds <- predict(mcen_fit, new_x)
## End(No test)



