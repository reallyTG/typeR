library(modules)


### Name: export
### Title: Define Modules in R
### Aliases: export expose extend import module autoTopEncl use

### ** Examples

## Not run: 
##D vignette("modulesInR", "modules")
## End(Not run)

m <- module({
  fun <- function(x) x
})

m$fun(1)

m <- module({

  import("stats", "median")
  export("fun")

  fun <- function(x) {
    ## This is an identity function
    ## x (ANY)
    x
  }

})

m$fun
m




