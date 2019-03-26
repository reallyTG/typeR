library(utiml)


### Name: mltrain
### Title: Build transformation models
### Aliases: mltrain

### ** Examples

# Create a empty model of type FOO
mltrain.baseFOO <- function (object, ...) {
   mymodel <- list(
     classes = as.character(unique(object$data[, object$labelindex]))
   )
   class(mymodel) <- 'fooModel'
   mymodel
}

# Using this base method with Binary Relevance
brmodel <- br(toyml, 'FOO')

## Not run: 
##D 
##D # Create a SVM method using the e1071 package
##D library(e1071)
##D mltrain.baseSVM <- function (object, ...) {
##D    traindata <- object$data[, -object$labelindex]
##D    labeldata <- object$data[, object$labelindex]
##D    model <- svm(traindata, labeldata, probability = TRUE, ...)
##D    model
##D }
## End(Not run)



