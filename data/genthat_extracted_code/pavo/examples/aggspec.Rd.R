library(pavo)


### Name: aggspec
### Title: Aggregate reflectance spectra
### Aliases: aggspec

### ** Examples

## Not run: 
##D data(teal)
##D 
##D # Average every two spectra
##D teal.sset1 <- aggspec(teal, by = 2)
##D plot(teal.sset1)
##D 
##D # Create factor and average spectra by levels 'a' and 'b'
##D ind <- rep(c('a', 'b'), times = 6)
##D teal.sset2 <- aggspec(teal, by = ind)
##D 
##D plot(teal.sset2)
## End(Not run)




