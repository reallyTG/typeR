library(automl)


### Name: automl_train
### Title: automl_train
### Aliases: automl_train

### ** Examples

## Not run: 
##D ##REGRESSION (predict Sepal.Length given other Iris parameters)
##D data(iris)
##D xmat <- cbind(iris[,2:4], as.numeric(iris$Species))
##D ymat <- iris[,1]
##D amlmodel <- automl_train(Xref = xmat, Yref = ymat)
## End(Not run)
##CLASSIFICATION (predict Species given other Iris parameters)
data(iris)
xmat = iris[,1:4]
lab2pred <- levels(iris$Species)
lghlab <- length(lab2pred)
iris$Species <- as.numeric(iris$Species)
ymat <- matrix(seq(from = 1, to = lghlab, by = 1), nrow(xmat), lghlab, byrow = TRUE)
ymat <- (ymat == as.numeric(iris$Species)) + 0
#with gradient descent and random hyperparameters sets
amlmodel <- automl_train(Xref = xmat, Yref = ymat,
                          autopar = list(numiterations = 1, psopartpopsize = 1, seed = 11),
                          hpar = list(numiterations = 10))



