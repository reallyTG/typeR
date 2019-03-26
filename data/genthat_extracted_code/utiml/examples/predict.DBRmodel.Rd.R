library(utiml)


### Name: predict.DBRmodel
### Title: Predict Method for DBR
### Aliases: predict.DBRmodel

### ** Examples

## Not run: 
##D # Predict SVM scores
##D model <- dbr(toyml)
##D pred <- predict(model, toyml)
##D 
##D # Passing a specif parameter for SVM predict algorithm
##D pred <- predict(model, toyml, na.action = na.fail)
##D 
##D # Using other classifier (EBR) to made the labels estimatives
##D estimative <- predict(ebr(toyml), toyml)
##D model <- dbr(toyml, estimate.models = FALSE)
##D pred <- predict(model, toyml, estimative = estimative)
## End(Not run)



