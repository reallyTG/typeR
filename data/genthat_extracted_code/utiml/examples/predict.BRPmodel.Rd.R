library(utiml)


### Name: predict.BRPmodel
### Title: Predict Method for BR+ (brplus)
### Aliases: predict.BRPmodel

### ** Examples

# Predict SVM scores
model <- brplus(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Predict SVM bipartitions and change the method to use No Update strategy
##D pred <- predict(model, toyml, strategy = 'NU', probability = FALSE)
##D 
##D # Predict using a random sequence to update the labels
##D labels <- sample(rownames(dataset$train$labels))
##D pred <- predict(model, toyml, strategy = 'Ord', order = labels)
##D 
##D # Passing a specif parameter for SVM predict method
##D pred <- predict(model, toyml, na.action = na.fail)
## End(Not run)



