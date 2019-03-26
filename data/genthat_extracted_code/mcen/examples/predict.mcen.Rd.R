library(mcen)


### Name: predict.mcen
### Title: predictions from a mcen model
### Aliases: predict.mcen

### ** Examples

x <- matrix(rnorm(400),ncol=4)
beta <- beta <- matrix(c(1,1,0,0,0,0,-1,-1,0,0,-1,-1,1,1,0,0),ncol=4)
y <- x%*%beta + rnorm(400) 
mcen_fit <- mcen(x,y,ky=2,delta=1)
new_x <- matrix(rnorm(12),ncol=4)
mcen_preds <- predict(mcen_fit, new_x)



