library(pacman)


### Name: p_loaded
### Title: Check for Loaded Packages
### Aliases: p_loaded p_isloaded
### Keywords: loaded packages

### ** Examples

## Not run: 
##D p_load(lattice, ggplot2)
## End(Not run)
p_loaded()
p_loaded(all=TRUE)
p_loaded(ggplot2, tm, qdap)

p_isloaded(ggplot2)
p_isloaded(ggplot2, dfs, pacman)
## Not run: p_unload(lattice)



