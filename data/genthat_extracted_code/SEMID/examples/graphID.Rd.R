library(SEMID)


### Name: graphID
### Title: Identifiability of linear structural equation models.
### Aliases: graphID

### ** Examples

## Not run: 
##D L = t(matrix(
##D   c(0, 1, 0, 0, 0,
##D     0, 0, 1, 0, 0,
##D     0, 0, 0, 1, 0,
##D     0, 0, 0, 0, 1,
##D     0, 0, 0, 0, 0), 5, 5))
##D O = t(matrix(
##D   c(0, 0, 1, 1, 0,
##D     0, 0, 0, 1, 1,
##D     0, 0, 0, 0, 0,
##D     0, 0, 0, 0, 0,
##D     0, 0, 0, 0, 0), 5, 5))
##D O=O+t(O)
##D graphID(L,O)
##D 
##D 
##D ## Examples from Foygel, Draisma & Drton (2012)
##D demo(SEMID)
## End(Not run)



