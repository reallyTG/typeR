library(utiml)


### Name: ebr
### Title: Ensemble of Binary Relevance for multi-label Classification
### Aliases: ebr

### ** Examples

model <- ebr(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use J48 with 90% of instances and only 5 rounds
##D model <- ebr(toyml, 'J48', m = 5, subsample = 0.9)
##D 
##D # Use 75% of attributes
##D model <- ebr(dataset$train, attr.space = 0.75)
##D 
##D # Running in 4 cores and define a specific seed
##D model1 <- ebr(toyml, cores=4, seed = 312)
## End(Not run)



