library(pacman)


### Name: p_unload
### Title: Unloads package(s)
### Aliases: p_unload
### Keywords: detach package

### ** Examples

## Not run: 
##D p_load(lattice)
##D p_loaded()
##D p_unload(lattice)
##D p_loaded()
##D 
##D p_load("lattice", "MASS")
##D p_loaded()
##D p_unload(all)
##D p_loaded() # will not work as you unloaded pacman
##D 
##D library(pacman)
##D p_load(lattice, MASS, foreign)
##D p_loaded()
##D p_unload(pacman, negate=TRUE)
##D p_loaded()
## End(Not run)



