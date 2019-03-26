library(intubate)


### Name: mhurdle
### Title: Interfaces for mhurdle package for data science pipelines.
### Aliases: ntbt_mhurdle
### Keywords: intubate magrittr mhurdle

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(mhurdle)
##D 
##D 
##D ## ntbt_mhurdle: Estimation of limited dependent variable models
##D data("Interview", package = "mhurdle")
##D 
##D ## Original function to interface
##D mhurdle(vacations ~ car + size | linc + linc2 | 0, Interview,
##D         dist = "ln", h2 = TRUE, method = "bfgs")
##D 
##D ## The interface puts data as first parameter
##D ntbt_mhurdle(Interview, vacations ~ car + size | linc + linc2 | 0,
##D              dist = "ln", h2 = TRUE, method = "bfgs")
##D 
##D ## so it can be used easily in a pipeline.
##D Interview %>%
##D   ntbt_mhurdle(vacations ~ car + size | linc + linc2 | 0,
##D                dist = "ln", h2 = TRUE, method = "bfgs")
## End(Not run)



