library(tcpl)


### Name: tcplVarMat
### Title: Create chemical by assay matrices
### Aliases: tcplVarMat

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
TCPLlite <- file.path(system.file(package = "tcpl"), "example")
tcplConf(db = TCPLlite, user = NA, host = NA, drvr = "tcplLite")
## Not run: 
##D ## Demonstrate the returned values. Note with no "burst" assays defined in
##D ## the example database, the user must provide which aeid values to use 
##D ## in calculating the cytotoxicity distributions for the 'zscore' matrix.
##D tcplVarMat(chid = 1:5, cyto.pars = list(aeid = 1:2))
##D 
##D ## Other changes can be made
##D tcplVarMat(chid = 1:5, row.id = "chnm", cyto.pars = list(aeid = 1:2))
##D tcplVarMat(chid = 1:5, add.vars = "max_med", cyto.pars = list(aeid = 1:2))
## End(Not run)
## Reset configuration
options(conf_store)




