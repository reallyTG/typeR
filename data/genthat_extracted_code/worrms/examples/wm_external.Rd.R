library(worrms)


### Name: wm_external
### Title: Get an external ID via an AphiaID
### Aliases: wm_external wm_external_

### ** Examples

## Not run: 
##D # by default, get a TSN (an ITIS code)
##D wm_external(id = 1080)
##D 
##D ## get many
##D wm_external_(id = c(1080, 126436))
##D 
##D # BOLD code
##D wm_external(id = 278468, type = "bold")
##D 
##D # NCBI code
##D wm_external(id = 278468, type = "ncbi")
##D 
##D # fishbase code
##D wm_external(id = 278468, type = "fishbase")
##D 
##D # curl options
##D library(crul)
##D wm_external(id = 105706, verbose = TRUE)
## End(Not run)



