library(utiml)


### Name: predict.CCmodel
### Title: Predict Method for Classifier Chains
### Aliases: predict.CCmodel

### ** Examples

model <- cc(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Predict SVM bipartitions
##D pred <- predict(model, toyml, prob = FALSE)
##D 
##D # Passing a specif parameter for SVM predict algorithm
##D pred <- predict(model, toyml, na.action = na.fail)
## End(Not run)



