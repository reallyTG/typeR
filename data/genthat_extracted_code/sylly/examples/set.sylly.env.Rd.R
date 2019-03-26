library(sylly)


### Name: set.sylly.env
### Title: A function to set information on your sylly environment
### Aliases: set.sylly.env
### Keywords: misc

### ** Examples

set.sylly.env(hyph.cache.file=file.path(tempdir(), "cache_file.RData"))
get.sylly.env(hyph.cache.file=TRUE)

## Not run: 
##D # example for setting permanent default values in an .Rprofile file
##D options(
##D   sylly=list(
##D     hyph.cache.file=file.path(tempdir(), "cache_file.RData"),
##D     lang="de"
##D   )
##D )
##D # be aware that setting a permamnent default language without loading
##D # the respective language support package might trigger errors
## End(Not run)



