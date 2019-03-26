library(utiml)


### Name: predict.CTRLmodel
### Title: Predict Method for CTRL
### Aliases: predict.CTRLmodel

### ** Examples

model <- ctrl(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Predict SVM bipartitions running in 6 cores
##D pred <- predict(model, toyml, probability = FALSE, cores = 6)
##D 
##D # Using the Maximum vote schema
##D pred <- predict(model, toyml, vote.schema = 'max')
## End(Not run)



