library(utiml)


### Name: esl
### Title: Ensemble of Single Label
### Aliases: esl

### ** Examples

model <- esl(toyml, "RANDOM")
pred <- predict(model, toyml)

## Not run: 
##D # Use SVM as base algorithm
##D model <- esl(toyml, "SVM")
##D pred <- predict(model, toyml)
##D 
##D # Change the base algorithm and use 4 CORES
##D model <- esl(toyml[1:50], 'RF', cores = 4, seed = 123)
##D 
##D # Set a parameters for all subproblems
##D model <- esl(toyml, 'KNN', k=5)
## End(Not run)



