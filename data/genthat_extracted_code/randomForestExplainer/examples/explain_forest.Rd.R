library(randomForestExplainer)


### Name: explain_forest
### Title: Explain a random forest
### Aliases: explain_forest

### ** Examples

## Not run: 
##D forest <- randomForest::randomForest(Species ~ ., data = iris, localImp = TRUE)
##D explain_forest(forest, interactions = TRUE)
## End(Not run)




