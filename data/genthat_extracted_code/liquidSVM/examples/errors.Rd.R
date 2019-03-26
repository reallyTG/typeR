library(liquidSVM)


### Name: errors
### Title: Obtain the test errors result.
### Aliases: errors

### ** Examples

modelTrees <- svm(Height ~ Girth + Volume, trees[1:10, ])  # least squares

y <- test(modelTrees,trees[-1:-10,])
errors(y)

## Not run: 
##D banana <- liquidData('banana-bc')
##D s_banana <- rocSVM(Y~., banana$test)
##D result <- test(s_banana, banana$train)
##D errors(result, showall=TRUE)
## End(Not run)



