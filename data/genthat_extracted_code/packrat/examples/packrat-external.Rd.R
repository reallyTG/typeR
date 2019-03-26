library(packrat)


### Name: packrat-external
### Title: Managing External Libraries
### Aliases: packrat-external with_extlib extlib user_lib packrat_lib

### ** Examples

## Not run: 
##D with_extlib("lattice", xyplot(1 ~ 1))
##D with_extlib(expr = packageVersion("lattice"))
##D # since devtools requires roxygen2 >= 5.0.0 for this step, this
##D # should fail unless roxygen2 is available in the packrat lib.loc
##D with_extlib("devtools", load_all("path/to/project"))
##D # this method will work given roxygen2 is installed in the
##D # non-packrat lib.loc with devtools
##D with_extlib(expr = devtools::load_all("path/to/project"))
## End(Not run)



