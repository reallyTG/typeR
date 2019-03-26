library(archetypes)


### Name: archmap
### Title: Archetypal maps
### Aliases: archmap

### ** Examples

## Not run: 
##D   data("skel", package = "archetypes")
##D   skel2 <- subset(skel, select = -Gender)
##D 
##D   set.seed(1981)
##D   a <- archetypes(skel2, k = 5)
##D 
##D   ## Simplex projection:
##D   archmap(a, col = skel$Gender)
##D 
##D   ## Simplex projection with archetypes arranged according to their
##D   ## distances:
##D   archmap(a, col = skel$Gender,
##D           projection = tspsimplex_projection)
##D   archmap(a, col = skel$Gender,
##D           projection = tspsimplex_projection,
##D           projection_args = list(equidist = TRUE))
##D 
##D   ## MDS projection:
##D   archmap(a, col = skel$Gender,
##D           projection = atypes_projection)
## End(Not run)



