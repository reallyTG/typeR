library(rsatscan)


### Name: ss.options
### Title: Set or reset parameters to be used by SaTScan
### Aliases: ss.options

### ** Examples

## Not run: 
##D head(ss.options(),3)
##D ss.options(list(CaseFile="NYCfever.cas"))
##D head(ss.options(),3)
##D 
##D # reset; shows whole parameter file without invisible()
##D invisible(ss.options(reset=TRUE))
##D head(ss.options(),3)
## End(Not run)



