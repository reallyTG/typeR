library(growthrates)


### Name: growthmodel
### Title: Create a User-defined Parametric Growth Model
### Aliases: growthmodel user-defined functions

### ** Examples


test <- function(time, parms) {
  with(as.list(parms), {
    y <- (K * y0) / (y0 + (K - y0) * exp(-mumax * time)) + y_shift
    return(as.matrix(data.frame(time=time, y=y, log_y=log(y))))
 })
}

mygrowthmodel <- growthmodel(test, c("y0", "mumax", "K", "y_shift"))





