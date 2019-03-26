library(utiml)


### Name: predict.EBRmodel
### Title: Predict Method for Ensemble of Binary Relevance
### Aliases: predict.EBRmodel

### ** Examples

## Not run: 
##D # Predict SVM scores
##D model <- ebr(toyml)
##D pred <- predict(model, toyml)
##D 
##D # Predict SVM bipartitions running in 6 cores
##D pred <- predict(model, toyml, prob = FALSE, cores = 6)
##D 
##D # Return the classes with the highest score
##D pred <- predict(model, toyml, vote = 'max')
## End(Not run)



