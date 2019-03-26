library(vanddraabe)


### Name: getAtomTypeCounts
### Title: Get AtomType Counts
### Aliases: getAtomTypeCounts

### ** Examples

  ## Not run: 
##D   set.seed(13)
##D   num.AtomTypes <- sample(1:10, 30, replace = TRUE)
##D   atom.types <- rep(sample(names.res.AtomTypes, 30), num.AtomTypes)
##D   getAtomTypeCounts(atom.types)
##D   # [1]  0 0 0 1 0 0 0 0 8 0 7 0 0 1 0 0 0 1 0 0 1 0 4 0 0 0 0 0 0 0 0 0 4
##D   #      0 0 9 0 0 0 0 0 0 0 0 0 0 0 5 0 6 0 0 0 0 0 0 0 0 6 0 0 0 0 0 7 0
##D   #      0 3 0 0 8 0 0 6 0 0 0 0 0 0 0 0 2 0 0 0 0 0 10 0 0 0 0 6 7 0 0 6
##D   #      0 0 7 0 0 0 0 0 0 0 0 9 0 0 0 0 0 0 0 0 0 0 9 0 0 0 0 0 0 0 0 0 0
##D   #      0 1 0 0 0 0 0 0 4 0 0 0 6 0 0 0 0 0 9 0 4 0 0 0 0 0 7 0 0 0 0 0 0
##D   #      0 0 0
##D   
## End(Not run)




