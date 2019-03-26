library(Rdpack)


### Name: rebib
### Title: Work with bibtex references in Rd documentation
### Aliases: rebib inspect_Rdbib
### Keywords: bibtex Rd

### ** Examples

## Not run: 
##D # update references in all Rd files in the package's 'man' directory
##D #
##D rdnames <- dir(path = "./man", pattern=".*[.]Rd$", full.names=TRUE)
##D lapply(rdnames, function(x) rebib(x, package="Rdpack"))
## End(Not run)



