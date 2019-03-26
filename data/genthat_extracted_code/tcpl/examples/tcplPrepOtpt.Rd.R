library(tcpl)


### Name: tcplPrepOtpt
### Title: Map assay/chemical ID values to annotation information
### Aliases: tcplPrepOtpt

### ** Examples


## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfExample()

## Load some example data
d1 <- tcplLoadData(1)

## Check for chemical name in 'dat'
"chnm" %in% names(d1) ## FALSE

#' ## Map all annotations 
d2 <- tcplPrepOtpt(d1) ##
"chnm" %in% names(d2) ## TRUE
"acnm" %in% names(d2) ## TRUE
 
## Map chemical annotation only
d3 <- tcplPrepOtpt(d1, ids = "spid")
"chnm" %in% names(d3) ## TRUE
"acnm" %in% names(d3) ## FALSE

## Reset configuration
options(conf_store)





