library(pavo)


### Name: as.rspec
### Title: Convert data to an rspec object
### Aliases: as.rspec is.rspec

### ** Examples

## Not run: 
##D 
##D # Generate some fake reflectance data
##D fakedat <- data.frame(wl = 300:700, refl1 = rnorm(401), refl2 = rnorm(401))
##D head(fakedat)
##D 
##D # Determine if is rspec object
##D is.rspec(fakedat)
##D 
##D # Convert to rspec object
##D fakedat2 <- as.rspec(fakedat)
##D is.rspec(fakedat2)
##D head(fakedat2)
## End(Not run)




