library(live)


### Name: local_approximation
### Title: Fit local model around the observation: shortcut for DALEX
###   explainer objects
### Aliases: local_approximation

### ** Examples

## Not run: 
##D data('wine')
##D library(randomForest)
##D library(DALEX)
##D rf <- randomForest(quality~., data = wine)
##D expl <- explain(rf, wine, wine$quality)
##D live_expl <- local_approximation(expl, wine[5, ], "quality", 500)
## End(Not run)




