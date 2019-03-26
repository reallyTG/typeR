library(utiml)


### Name: predict.BRmodel
### Title: Predict Method for Binary Relevance
### Aliases: predict.BRmodel

### ** Examples

model <- br(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Predict SVM scores
##D model <- br(toyml, "SVM")
##D pred <- predict(model, toyml)
##D 
##D # Predict SVM bipartitions running in 4 cores
##D pred <- predict(model, toyml, probability = FALSE, CORES = 4)
##D 
##D # Passing a specif parameter for SVM predict algorithm
##D pred <- predict(model, dataset$test, na.action = na.fail)
## End(Not run)



