library(rmarkdown)


### Name: pandoc_available
### Title: Check pandoc availability and version
### Aliases: pandoc_available pandoc_version

### ** Examples

## Not run: 
##D library(rmarkdown)
##D 
##D if (pandoc_available())
##D   cat("pandoc", as.character(pandoc_version()), "is available!\n")
##D 
##D if (pandoc_available("1.12.3"))
##D   cat("required version of pandoc is available!\n")
## End(Not run)



