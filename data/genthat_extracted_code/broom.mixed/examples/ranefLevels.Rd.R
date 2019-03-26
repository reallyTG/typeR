library(broom.mixed)


### Name: ranefLevels
### Title: Extract the levels of factors used for random effects in
###   'MCMCglmm' objects
### Aliases: ranefLevels

### ** Examples

## Not run: 
##D   # a simple MCMCglmm model
##D   data(PlodiaPO)
##D   m <- MCMCglmm(PO ~ 1, random = ~ FSfamily, data = PlodiaPO, verbose=FALSE)
##D 
##D   # extract the random effects levels
##D   ranefLevels(m, PlodiaPO)
## End(Not run)



