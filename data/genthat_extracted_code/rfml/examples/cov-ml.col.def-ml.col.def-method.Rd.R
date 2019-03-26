library(rfml)


### Name: cov,ml.col.def,ml.col.def-method
### Title: Covariance
### Aliases: cov,ml.col.def,ml.col.def-method

### ** Examples

## Not run: 
##D  library(rfml)
##D  locConn <- ml.connect()
##D  # create a ml.data.frame based on a search
##D  mlIris <- ml.data.frame(locConn,collection = "iris")
##D  # return the Covariance
##D  cov(mlIris$Sepal.Length, mlIris$Petal.Length)
## End(Not run)



