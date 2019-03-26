library(parallelML)


### Name: parallelML-package
### Title: Parallel-Voting version of machine learning algorithms
### Aliases: parallelML-package
### Keywords: package

### ** Examples

## Not run: 
##D # Load the library which provides svm
##D library(e1071)
##D 
##D # Create your data
##D data(iris)
##D 
##D # Create a model
##D parSvmModel <- parallelML("svm(formula = Species ~ ., data = iris)",
##D                      "e1071",samplingSize = 0.8)
##D 
##D # Get prediction
##D parSvmPred   <- predictML("predict(parSvmModel,newdata=iris)",
##D                           "e1071","vote")
##D 
##D # Check the quality
##D table(parSvmPred,iris$Species)
## End(Not run)



