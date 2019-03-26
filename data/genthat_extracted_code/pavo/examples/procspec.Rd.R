library(pavo)


### Name: procspec
### Title: Process spectra
### Aliases: procspec

### ** Examples

## Not run: 
##D data(teal)
##D plot(teal, select = 10)
##D 
##D # Smooth data to remove noise
##D teal.sm <- procspec(teal, opt = 'smooth', span = 0.25)
##D plot(teal.sm, select = 10)
##D 
##D # Normalize to max of unity
##D teal.max <- procspec(teal, opt = c('max'), span = 0.25)
##D plot(teal.max, select = 10)
## End(Not run)




