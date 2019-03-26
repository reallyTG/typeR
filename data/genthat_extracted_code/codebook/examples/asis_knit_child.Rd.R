library(codebook)


### Name: asis_knit_child
### Title: Knit a child document and output as is (render markup)
### Aliases: asis_knit_child

### ** Examples

## Not run: 
##D # an example of a wrapper function that calls asis_knit_child with an argument
##D # ensures distinct paths for cache and figures, so that these calls can be looped in parallel
##D regression_summary <- function(model) {
##D    hash <- digest::digest(model)
##D    options <- list(
##D        fig.path = paste0(knitr::opts_chunk$get("fig.path"), hash, "-"),
##D        cache.path = paste0(knitr::opts_chunk$get("cache.path"), hash, "-"))
##D    asis_knit_child("_regression_summary.Rmd", options = options)
##D }
## End(Not run)



