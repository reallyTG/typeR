library(utiml)


### Name: ns
### Title: Nested Stacking for multi-label Classification
### Aliases: ns

### ** Examples

model <- ns(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use a specific chain with J48 classifier
##D mychain <- sample(rownames(toyml$labels))
##D model <- ns(toyml, 'J48', mychain)
##D 
##D # Set a specific parameter
##D model <- ns(toyml, 'KNN', k=5)
## End(Not run)



