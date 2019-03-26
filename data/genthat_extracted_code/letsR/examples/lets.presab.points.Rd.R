library(letsR)


### Name: lets.presab.points
### Title: Create a presence-absence matrix based on species' point
###   occurrences
### Aliases: lets.presab.points

### ** Examples

## Not run: 
##D species <- c(rep("sp1", 100), rep("sp2", 100),
##D              rep("sp3", 100), rep("sp4", 100))
##D x <- runif(400, min = -69, max = -51)
##D y <- runif(400, min = -23, max = -4)
##D xy <- cbind(x, y)
##D PAM <- lets.presab.points(xy, species, xmn = -93, xmx = -29, 
##D                           ymn = -57, ymx = 15)
##D summary(PAM)
##D # Species richness map
##D plot(PAM, xlab = "Longitude", ylab = "Latitude",
##D      main = "Species richness map (simulated)")
##D 
##D # Map of the specific species  
##D plot(PAM, name = "sp1")  
## End(Not run)





