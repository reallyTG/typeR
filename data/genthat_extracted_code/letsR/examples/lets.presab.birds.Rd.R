library(letsR)


### Name: lets.presab.birds
### Title: Create a presence-absence matrix of species' geographic ranges
###   within a grid for the Birdlife spatial data
### Aliases: lets.presab.birds

### ** Examples

## Not run: 
##D # Constructing a Presence/Absence matrix for birds 
##D # Attention: For your own files, omit the 'system.file' 
##D # and 'package="letsR"', these are just to get the path
##D # to files installed with the package. 
##D path.Ramphastos <- system.file("extdata", package = "letsR")
##D PAM <- lets.presab.birds(path.Ramphastos, xmn = -93, xmx = -29, 
##D                          ymn = -57, ymx = 25)
##D                          
##D # Species richness map
##D plot(PAM, xlab = "Longitude", ylab = "Latitude",
##D      main = "Ramphastos species Richness")  
##D 
## End(Not run)




