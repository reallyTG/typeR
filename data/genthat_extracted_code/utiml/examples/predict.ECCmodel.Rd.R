library(utiml)


### Name: predict.ECCmodel
### Title: Predict Method for Ensemble of Classifier Chains
### Aliases: predict.ECCmodel

### ** Examples

## Not run: 
##D # Predict SVM scores
##D model <- ecc(toyml)
##D pred <- predict(model, toyml)
##D 
##D # Predict SVM bipartitions running in 6 cores
##D pred <- predict(model, toyml, probability = FALSE, cores = 6)
##D 
##D # Return the classes with the highest score
##D pred <- predict(model, toyml, vote.schema = 'max')
## End(Not run)



