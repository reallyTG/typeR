library(intubate)


### Name: gee
### Title: Interfaces for gee package for data science pipelines.
### Aliases: ntbt_gee
### Keywords: intubate magrittr gee

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(gee)
##D 
##D ## ntbt_gee: solve a Generalized Estimation Equation Model
##D data(warpbreaks)
##D 
##D ## Original function to interface
##D gee(breaks ~ tension, id=wool, data=warpbreaks, corstr="exchangeable")
##D 
##D ## The interface puts data as first parameter
##D ntbt_gee(warpbreaks, breaks ~ tension, id=wool, corstr="exchangeable")
##D 
##D ## so it can be used easily in a pipeline.
##D warpbreaks %>%
##D   ntbt_gee(breaks ~ tension, id=wool, corstr="exchangeable")
## End(Not run)



