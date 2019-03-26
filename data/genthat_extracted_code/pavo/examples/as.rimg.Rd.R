library(pavo)


### Name: as.rimg
### Title: Convert data to an rimg object
### Aliases: as.rimg is.rimg

### ** Examples

## Not run: 
##D 
##D # Generate some fake image data
##D fake <- array(c(
##D as.matrix(rep(c(0.2, 0.4, 0.6), each = 250)),
##D as.matrix(rep(c(0.4, 0.7, 0.8), each = 250)),
##D as.matrix(rep(c(0.6, 0.1, 0.2), each = 250))),
##D dim = c(750, 750, 3))
##D 
##D # Inspect it
##D head(fakedat)
##D 
##D # Determine if is rimg object
##D is.rimg(fake)
##D 
##D # Convert to rimg object and check again
##D fake2 <- as.rimg(fake)
##D is.rimg(fake2)
##D 
## End(Not run)




