library(utiml)


### Name: ecc
### Title: Ensemble of Classifier Chains for multi-label Classification
### Aliases: ecc

### ** Examples

# Use all default values
model <- ecc(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use J48 with 100% of instances and only 5 rounds
##D model <- ecc(toyml, 'J48', m = 5, subsample = 1)
##D 
##D # Use 75% of attributes
##D model <- ecc(toyml, attr.space = 0.75)
##D 
##D # Running in 4 cores and define a specific seed
##D model1 <- ecc(toyml, cores=4, seed=123)
## End(Not run)



