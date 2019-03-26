library(intubate)


### Name: mnlogit
### Title: Interfaces for mnlogit package for data science pipelines.
### Aliases: ntbt_mnlogit
### Keywords: intubate magrittr mnlogit

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(mnlogit)
##D 
##D 
##D ## ntbt_mnlogit: Fast estimation of multinomial logit models
##D library(mnlogit)
##D data(Fish, package = "mnlogit")
##D 
##D ## Original function to interface
##D mnlogit(mode ~ price | income | catch, Fish, ncores = 2)
##D 
##D ## The interface puts data as first parameter
##D ntbt_mnlogit(Fish, mode ~ price | income | catch, ncores = 2)
##D 
##D ## so it can be used easily in a pipeline.
##D Fish %>%
##D   ntbt_mnlogit(mode ~ price | income | catch, ncores = 2)
## End(Not run)



