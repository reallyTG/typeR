library(h2o)


### Name: h2o.init
### Title: Initialize and Connect to H2O
### Aliases: h2o.init

### ** Examples

## Not run: 
##D # Try to connect to a local H2O instance that is already running.
##D # If not found, start a local H2O instance from R with the default settings.
##D h2o.init()
##D 
##D # Try to connect to a local H2O instance.
##D # If not found, raise an error.
##D h2o.init(startH2O = FALSE)
##D 
##D # Try to connect to a local H2O instance that is already running.
##D # If not found, start a local H2O instance from R with 5 gigabytes of memory.
##D h2o.init(max_mem_size = "5g")
##D 
##D # Try to connect to a local H2O instance that is already running.
##D # If not found, start a local H2O instance from R that uses 5 gigabytes of memory.
##D h2o.init(max_mem_size = "5g")
## End(Not run)



