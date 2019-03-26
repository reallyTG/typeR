library(broom.mixed)


### Name: ranef.MCMCglmm
### Title: Extract random effects from an 'MCMCglmm' object
### Aliases: ranef.MCMCglmm

### ** Examples

## Not run: 
##D   # a simple MCMCglmm model
##D   data(PlodiaPO)
##D   m <- MCMCglmm(PO ~ 1, random= ~ FSfamily, data=PlodiaPO, pr=TRUE, verbose=FALSE)
##D 
##D   # only extract average fixed effects
##D   head(ranef(m, use = "mean"))
##D 
##D   # histogram of posterior samples of fixed effects
##D   hist(ranef(m)[1, ])
##D   # matches the mean
##D   rowMeans(ranef(m)[1:6, ])
## End(Not run)



