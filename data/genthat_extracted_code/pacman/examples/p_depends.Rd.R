library(pacman)


### Name: p_depends
### Title: Package Dependencies
### Aliases: p_depends p_depends_reverse
### Keywords: dependencies dependency

### ** Examples

p_depends(lattice)
p_depends_reverse(lattice)

## Not run: 
##D ## dependencies from CRAN
##D p_depends(pacman)
##D p_depends_reverse("pacman")
##D 
##D ## local dependencies 
##D p_depends(pacman, local = TRUE)
##D p_depends_reverse("qdap", local = TRUE)
## End(Not run)



