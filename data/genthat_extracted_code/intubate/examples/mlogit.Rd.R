library(intubate)


### Name: mlogit
### Title: Interfaces for mlogit package for data science pipelines.
### Aliases: ntbt_mlogit
### Keywords: intubate magrittr mlogit

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(mlogit)
##D 
##D 
##D ## ntbt_mlogit: Multinomial logit model
##D data("Fishing", package = "mlogit")
##D Fish <- mlogit.data(Fishing, varying = c(2:9), shape = "wide", choice = "mode")
##D 
##D ## Original function to interface
##D mlogit(mode ~ price + catch, data = Fish)
##D 
##D ## The interface puts data as first parameter
##D ntbt_mlogit(Fish, mode ~ price + catch)
##D 
##D ## so it can be used easily in a pipeline.
##D Fish %>%
##D   ntbt_mlogit(mode ~ price + catch)
## End(Not run)



