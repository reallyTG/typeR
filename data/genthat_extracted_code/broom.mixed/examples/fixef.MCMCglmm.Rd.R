library(broom.mixed)


### Name: fixef.MCMCglmm
### Title: Extract fixed effects from an 'MCMCglmm' object
### Aliases: fixef.MCMCglmm

### ** Examples

## Not run: 
##D   # a simple MCMCglmm model
##D   data(PlodiaPO)
##D   m <- MCMCglmm(PO ~ 1, random= ~ FSfamily, data=PlodiaPO, verbose=FALSE)
##D 
##D   # only extract average fixed effects
##D   fixef(m, use = "mean")
##D 
##D   # histogram of posterior samples of fixed effects
##D   hist(fixef(m))
##D   # matches the mean
##D   rowMeans(fixef(m))
## End(Not run)



