library(vetools)


### Name: complete.series
### Title: Complete relatively large holes in data-sets
### Aliases: complete.series
### Keywords: EM completion

### ** Examples
## Not run: 
##D for (k in 1:15) {
##D         fit[[k]] = lm(collection$data[[k]] ~ ZZ - 1, singular.ok=T, na.action=na.omit)
##D }
##D collection.completed = complete.series(collection, fit)
## End(Not run)


