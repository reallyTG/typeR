library(intubate)


### Name: MCMCglmm
### Title: Interfaces for MCMCglmm package for data science pipelines.
### Aliases: ntbt_MCMCglmm
### Keywords: intubate magrittr MCMCglmm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(MCMCglmm)
##D 
##D 
##D ## ntbt_MCMCglmm: Multivariate Generalised Linear Mixed Models
##D data(PlodiaPO)
##D 
##D ## Original function to interface
##D set.seed(1)
##D model <- MCMCglmm(PO ~ 1, random = ~ FSfamily, data = PlodiaPO, verbose = FALSE)
##D summary(model)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D model <- ntbt_MCMCglmm(PlodiaPO, PO ~ 1, random = ~ FSfamily, verbose = FALSE)
##D summary(model)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D PlodiaPO %>%
##D   ntbt_MCMCglmm(PO ~ 1, random = ~ FSfamily, verbose = FALSE) %>%
##D   summary()
## End(Not run)



