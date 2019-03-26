library(tcpl)


### Name: tcplLvlCount
### Title: Load tcpl level counts
### Aliases: tcplLvlCount

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
TCPLlite <- file.path(system.file(package = "tcpl"), "example")
tcplConf(db = TCPLlite, user = NA, host = NA, drvr = "tcplLite")
 
## Get all counts for level 1 for multiple-concentration
tcplLvlCount(lvls = 1)

## Not run: 
##D ## Get all counts for levels 4 through 7 for multiple-concentration
##D tcplLvlCount(lvls = 4:7)
##D 
##D ## Get all counts for multiple-concentration data, note 'mc' is the 
##D ## default value for type
##D tcplLvlCount()
## End(Not run)

## Reset configuration
options(conf_store)




