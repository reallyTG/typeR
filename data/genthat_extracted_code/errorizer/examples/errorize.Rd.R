library(errorizer)


### Name: errorize
### Title: Function to create "Errorized" version of existing R functions.
### Aliases: errorize

### ** Examples

## Not run: 
##D lm <- errorize(stats::lm)
##D data("cars")
##D lm(speed ~ dist, data = cars)             # works
##D lm(speed ~ missing_variable, data = cars) # this errors out and saves the data to a .Rds file
##D 
##D # read the saved data back in (timestamp on filename will change based on when the above is run)
##D er <- readRDS('./lm_error_1478361734.Rds')
##D 
##D # use do.call to recreate the error
##D do.call(er$fxn, er$arglst)
## End(Not run)



