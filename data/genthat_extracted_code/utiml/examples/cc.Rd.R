library(utiml)


### Name: cc
### Title: Classifier Chains for multi-label Classification
### Aliases: cc

### ** Examples

model <- cc(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use a specific chain with J48 classifier
##D mychain <- sample(rownames(toyml$labels))
##D model <- cc(toyml, 'J48', mychain)
##D 
##D # Set a specific parameter
##D model <- cc(toyml, 'KNN', k=5)
##D 
##D #Run with multiple-cores
##D model <- cc(toyml, 'RF', cores = 5, seed = 123)
## End(Not run)



