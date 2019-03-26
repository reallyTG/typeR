library(utiml)


### Name: prudent
### Title: PruDent classifier for multi-label Classification
### Aliases: prudent

### ** Examples

model <- prudent(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use different phi correlation with J48 classifier
##D model <- prudent(toyml, 'J48', 0.3)
##D 
##D # Set a specific parameter
##D model <- prudent(toyml, 'KNN', k=5)
## End(Not run)



