library(VSURF)


### Name: predict.VSURF
### Title: Predict method for VSURF object
### Aliases: predict.VSURF

### ** Examples


## Not run: 
##D data(iris)
##D iris.learn <- sample(1:nrow(iris), nrow(iris)/2)
##D iris.vsurf <- VSURF(iris[iris.learn, 1:4], iris[iris.learn, 5], ntree = 100, nfor.thres = 20,
##D                     nfor.interp = 10, nfor.pred = 10)
##D iris.predictions <- predict(iris.vsurf, newdata = iris[-iris.learn, 1:4])
##D 
##D # A more interesting example with toys data (see \code{toys})
##D # (a few minutes to execute)
##D data(toys)
##D toys.learn <- 1:(nrow(toys$x) / 2)
##D toys.vsurf <- VSURF(toys$x[toys.learn, ], toys$y[toys.learn])
##D toys.predictions <- predict(toys.vsurf, newdata = toys$x[-toys.learn, ])
## End(Not run)




