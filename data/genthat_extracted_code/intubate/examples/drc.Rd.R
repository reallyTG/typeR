library(intubate)


### Name: drc
### Title: Interfaces for drc package for data science pipelines.
### Aliases: ntbt_drm
### Keywords: intubate magrittr drc drm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(drc)
##D 
##D ## ntbt_drm: Fitting dose-response models
##D ## Original function to interface
##D drm(rootl ~ conc, data = ryegrass, fct = W2.4())
##D 
##D ## The interface puts data as first parameter
##D ntbt_drm(ryegrass, rootl ~ conc, fct = W2.4())
##D 
##D ## so it can be used easily in a pipeline.
##D ryegrass %>%
##D   ntbt_drm(rootl ~ conc, fct = W2.4())
## End(Not run)



