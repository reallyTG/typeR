library(crtests)


### Name: print.multitest_evaluation.summary
### Title: Print a multitest_evaluation.summary object
### Aliases: print.multitest_evaluation.summary

### ** Examples

## Not run: 
##D library(crtests)
##D library(randomForest)
##D library(rpart)
##D library(caret)
##D library(stringr)
##D 
##D # A classification multitest. The result is an object of class multitest_evaluation
##D multitest_evaluation <- multitest(data = iris,
##D                                   dependent = "Species",
##D                                   problem = "classification",
##D                                   method = "randomForest",
##D                                   name = "An example classification multitest",
##D                                   iterations = 10,
##D                                   cross_validation = TRUE,
##D                                   preserve_distribution = TRUE
##D )
##D print(summary(multitest_evaluation))
##D 
## End(Not run)



