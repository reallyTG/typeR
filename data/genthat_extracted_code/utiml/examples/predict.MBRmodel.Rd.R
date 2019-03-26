library(utiml)


### Name: predict.MBRmodel
### Title: Predict Method for Meta-BR/2BR
### Aliases: predict.MBRmodel

### ** Examples

## Not run: 
##D # Predict SVM scores
##D model <- mbr(toyml)
##D pred <- predict(model, toyml)
##D 
##D # Predict SVM bipartitions
##D pred <- predict(model, toyml, probability = FALSE)
##D 
##D # Passing a specif parameter for SVM predict algorithm
##D pred <- predict(model, toyml, na.action = na.fail)
## End(Not run)



