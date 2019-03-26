library(utiml)


### Name: predict.PruDentmodel
### Title: Predict Method for PruDent
### Aliases: predict.PruDentmodel

### ** Examples

## Not run: 
##D # Predict SVM scores
##D model <- prudent(toyml)
##D pred <- predict(model, toyml)
##D 
##D # Predict SVM bipartitions
##D pred <- predict(model, toyml, probability = FALSE)
##D 
##D # Passing a specif parameter for SVM predict algorithm
##D pred <- predict(model, toyml, na.action = na.fail)
## End(Not run)



