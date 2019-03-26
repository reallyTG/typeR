library(utiml)


### Name: mbr
### Title: Meta-BR or 2BR for multi-label Classification
### Aliases: mbr

### ** Examples

model <- mbr(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use 10 folds and different phi correlation with J48 classifier
##D model <- mbr(toyml, 'J48', 10, 0.2)
##D 
##D # Run with 4 cores
##D  model <- mbr(toyml, "SVM", cores = 4, seed = 123)
##D 
##D # Set a specific parameter
##D model <- mbr(toyml, 'KNN', k=5)
## End(Not run)



