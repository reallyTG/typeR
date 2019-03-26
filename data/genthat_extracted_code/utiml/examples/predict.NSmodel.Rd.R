library(utiml)


### Name: predict.NSmodel
### Title: Predict Method for Nested Stacking
### Aliases: predict.NSmodel

### ** Examples

model <- ns(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Predict SVM bipartitions
##D pred <- predict(model, toyml, probability = FALSE)
##D 
##D # Passing a specif parameter for SVM predict algorithm
##D pred <- predict(model, toyml, na.action = na.fail)
## End(Not run)



