library(caret)


### Name: diff.resamples
### Title: Inferential Assessments About Model Performance
### Aliases: diff.resamples summary.diff.resamples compare_models
### Keywords: models

### ** Examples


## Not run: 
##D #load(url("http://topepo.github.io/caret/exampleModels.RData"))
##D 
##D resamps <- resamples(list(CART = rpartFit,
##D                           CondInfTree = ctreeFit,
##D                           MARS = earthFit))
##D 
##D difs <- diff(resamps)
##D 
##D difs
##D 
##D summary(difs)
##D 
##D compare_models(rpartFit, ctreeFit)
## End(Not run)




