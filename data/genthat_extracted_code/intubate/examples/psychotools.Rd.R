library(intubate)


### Name: psychotools
### Title: Interfaces for psychotools package for data science pipelines.
### Aliases: ntbt_anchor ntbt_anchortest
### Keywords: intubate magrittr psychotools anchor anchortest

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(psychotools)
##D 
##D 
##D ## ntbt_anchor: Anchor Methods for the Detection of Uniform DIF the Rasch Model
##D data("VerbalAggression", package = "psychotools")
##D 
##D ## Original function to interface
##D anchor(resp2[, 1:12] ~ gender, data = VerbalAggression,
##D        class = "forward", select = "MTT", range = c(0.05, 1))
##D 
##D ## The interface puts data as first parameter
##D ntbt_anchor(VerbalAggression, resp2[, 1:12] ~ gender, 
##D             class = "forward", select = "MTT", range = c(0.05, 1))
##D 
##D ## so it can be used easily in a pipeline.
##D VerbalAggression %>%
##D   ntbt_anchor(resp2[, 1:12] ~ gender, 
##D               class = "forward", select = "MTT", range = c(0.05, 1))
##D 
##D 
##D ## ntbt_anchortest: Anchor methods for the detection of uniform DIF the Rasch model
##D 
##D ## Original function to interface
##D anchortest(resp2[, 1:12] ~ gender, data = VerbalAggression,
##D            class = "forward", select = "MTT", range = c(0.05, 1))
##D 
##D ## The interface puts data as first parameter
##D ntbt_anchortest(VerbalAggression, resp2[, 1:12] ~ gender,
##D                 class = "forward", select = "MTT", range = c(0.05, 1))
##D 
##D ## so it can be used easily in a pipeline.
##D VerbalAggression %>%
##D   ntbt_anchortest(resp2[, 1:12] ~ gender,
##D                   class = "forward", select = "MTT", range = c(0.05, 1))
## End(Not run)



