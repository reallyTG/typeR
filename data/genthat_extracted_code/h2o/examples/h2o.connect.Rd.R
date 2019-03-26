library(h2o)


### Name: h2o.connect
### Title: Connect to a running H2O instance.
### Aliases: h2o.connect

### ** Examples

## Not run: 
##D library(h2o)
##D # Try to connect to a H2O instance running at http://localhost:54321/cluster_X
##D # If not found, start a local H2O instance from R with the default settings.
##D #h2o.connect(ip = "localhost", port = 54321, context_path = "cluster_X")
##D # Or
##D #config = list(ip = "localhost", port = 54321, context_path = "cluster_X")
##D #h2o.connect(config = config)
##D 
##D # Skip strict version check during connecting to the instance
##D #h2o.connect(config = c(strict_version_check = FALSE, config))
## End(Not run)



