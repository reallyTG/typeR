library(rapportools)


### Name: is.empty
### Title: Empty Value
### Aliases: is.empty

### ** Examples

## Not run: 
##D is.empty(NULL)     # [1] TRUE
##D is.empty(c())      # [1] TRUE
##D is.empty(NA)       # [1] TRUE
##D is.empty(NaN)      # [1] TRUE
##D is.empty("")       # [1] TRUE
##D is.empty(0)        # [1] TRUE
##D is.empty(0.00)     # [1] TRUE
##D is.empty("    ")   # [1] TRUE
##D is.empty("foobar") # [1] FALSE
##D is.empty("    ", trim = FALSE)    # [1] FALSE
##D # is.empty is vectorised!
##D all(is.empty(rep("", 10)))        # [1] TRUE
##D all(is.empty(matrix(NA, 10, 10))) # [1] TRUE
## End(Not run)



