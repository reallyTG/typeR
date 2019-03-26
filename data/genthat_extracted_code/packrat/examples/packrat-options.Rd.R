library(packrat)


### Name: packrat-options
### Title: Get/set packrat project options
### Aliases: packrat-options get_opts set_opts opts
### Keywords: datasets

### ** Examples

## Not run: 
##D ## use 'devtools' and 'knitr' from the user library
##D packrat::set_opts(external.packages = c("devtools", "knitr"))
##D 
##D ## set local repository
##D packrat::set_opts(local.repos = c("~/projects/R"))
##D 
##D ## get the set of 'external packages'
##D packrat::opts$external.packages()
##D 
##D ## set the external packages
##D packrat::opts$external.packages(c("devtools", "knitr"))
## End(Not run)



