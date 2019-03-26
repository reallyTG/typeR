library(utiml)


### Name: predict.RDBRmodel
### Title: Predict Method for RDBR
### Aliases: predict.RDBRmodel

### ** Examples

## Not run: 
##D # Predict SVM scores
##D model <- rdbr(toyml)
##D pred <- predict(model, toyml)
##D 
##D # Passing a specif parameter for SVM predict algorithm
##D pred <- predict(model, toyml, na.action = na.fail)
##D 
##D # Use the batch mode and increase the max number of iteration to 10
##D pred <- predict(model, toyml, max.iterations = 10, batch.mode = TRUE)
##D 
##D # Using other classifier (EBR) to made the labels estimatives
##D estimative <- predict(ebr(toyml), toyml, probability = FALSE)
##D model <- rdbr(toyml, estimate.models = FALSE)
##D pred <- predict(model, toyml, estimative = estimative)
## End(Not run)



