library(cdfquantreg)


### Name: bugsModel
### Title: Generating OpenBUGS Model File
### Aliases: bugsModel

### ** Examples

## Not run: 
##D # Need write access in the working directory before executing the code.
##D # No random component
##D bugsModel(y ~ x1 | x2, 't2','t2', random = NULL)
##D # Random component as subject ID
##D bugsModel(y ~ x1 | x2, 't2','t2', random = 'ID')
## End(Not run)




