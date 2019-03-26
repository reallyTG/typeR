library(parallelSVM)


### Name: parallelSVM-package
### Title: Parallel-voting version of Support-Vector-Machine
### Aliases: parallelSVM-package
### Keywords: package

### ** Examples

## Not run: 
##D # Create your data
##D data(iris)
##D x <- subset(iris, select = -Species)
##D y <- iris$Species
##D 
##D # Create a model
##D model <- parallelSVM(x, y)
##D 
##D # Get prediction
##D predictions <- predict(model, x)
##D 
##D # Check the quality
##D table(predictions,y)
## End(Not run)



