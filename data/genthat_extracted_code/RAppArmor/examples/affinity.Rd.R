library(RAppArmor)


### Name: affinity
### Title: Process Affinity
### Aliases: affinity setaffinity getaffinity_count getaffinity
###   has_affinity ncores

### ** Examples

## Not run: 
##D # Current affinity
##D ncores()
##D getaffinity()
##D getaffinity_count()
##D 
##D # Restrict process to core number 1.
##D setaffinity(1)
##D getaffinity()
##D 
##D # Reset
##D setaffinity()
##D getaffinity()
## End(Not run)



