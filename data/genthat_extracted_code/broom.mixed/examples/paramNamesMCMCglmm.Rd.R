library(broom.mixed)


### Name: paramNamesMCMCglmm
### Title: Extract the parameter names from an 'MCMCglmm' object
### Aliases: paramNamesMCMCglmm
### Keywords: internal

### ** Examples

## Not run: 
##D   # a simple MCMCglmm model
##D   if (require(MCMCglmm)) {
##D      data(PlodiaPO)
##D      m <- MCMCglmm(PO ~ 1, random = ~ FSfamily, data = PlodiaPO, verbose=FALSE, pr=TRUE)
##D   }
##D   # extract the parameter names
##D   paramNamesMCMCglmm(m)
## End(Not run)



