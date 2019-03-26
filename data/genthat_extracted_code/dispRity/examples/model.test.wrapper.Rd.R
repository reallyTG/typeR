library(dispRity)


### Name: model.test.wrapper
### Title: Model test wrapper
### Aliases: model.test.wrapper

### ** Examples


## Not run: 
##D ## Mammal disparity through time
##D data(BeckLee_disparity)
##D 
##D ## The models to be fit to disparity data
##D models <- list("BM", "OU", "multi.OU", "Trend")
##D 
##D ## test all models, and assess the significance of simulated data
##D ## against the empirical distribution for each
##D model.test.wrapper(data = BeckLee_disparity, model = models, fixed.optima = TRUE,
##D                    time.split = 66, show.p = TRUE)
## End(Not run)




