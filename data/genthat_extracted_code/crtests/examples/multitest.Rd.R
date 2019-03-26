library(crtests)


### Name: multitest
### Title: Create and run multiple instances of a test
### Aliases: multitest

### ** Examples

## Not run: 
##D library(crtests)
##D library(randomForest)
##D library(rpart)
##D library(caret)
##D library(stringr)
##D 
##D # A classification multitest
##D multitest(data = iris,
##D           dependent = "Species",
##D           problem = "classification",
##D           method = "randomForest",
##D           name = "An example classification multitest",
##D           iterations = 10,
##D           cross_validation = TRUE,
##D           preserve_distribution = TRUE
##D )
##D 
##D # A regression multitest
##D multitest(data = iris,
##D           dependent = "Sepal.Width",
##D           problem = "regression",
##D           method = "rpart",
##D           name = "An example regression multitest",
##D           iterations = 15,
##D           cross_validation = FALSE,
##D )
##D 
## End(Not run)



