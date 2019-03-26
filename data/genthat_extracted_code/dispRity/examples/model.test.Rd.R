library(dispRity)


### Name: model.test
### Title: Model Test
### Aliases: model.test

### ** Examples


## Not run: 
##D ## Mammal disparity through time
##D data(BeckLee_disparity)
##D 
##D ## The four models to fit
##D models <- list("BM", "OU", "multi.OU", c("BM", "OU"))
##D 
##D ## Fitting the four models to the disparity data
##D tests <- model.test(BeckLee_disparity, models, time.split = 66)
##D 
##D ## Summarising the models
##D summary(tests)
##D 
##D ## Plotting only the models support
##D plot(tests)
## End(Not run)




