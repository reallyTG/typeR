library(utiml)


### Name: ctrl
### Title: CTRL model for multi-label Classification
### Aliases: ctrl

### ** Examples

model <- ctrl(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Change default values and use 4 CORES
##D model <- ctrl(toyml, 'C5.0', m = 10, validation.size = 0.4,
##D               validation.threshold = 0.5, cores = 4)
##D 
##D # Use seed
##D model <- ctrl(toyml, 'RF', cores = 4, seed = 123)
##D 
##D # Set a parameters for all subproblems
##D model <- ctrl(dataset$train, 'KNN', k=5)
## End(Not run)



