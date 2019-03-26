library(tcpl)


### Name: Method functions
### Title: Functions for managing processing methods
### Aliases: 'Method functions' tcplMthdAssign tcplMthdClear tcplMthdList
###   tcplMthdLoad

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfDefault()

## tcplListMthd allows the user to display the available methods for 
## a given level and data type
head(tcplMthdList(lvl = 2, type = "mc"))

## tcplLoadMthd shows which methods are assigned for the given ID, level,
## and data type. Here we will show how to register, load, and clear methods
## using an acid not in the example database. Note: There is no check for
## whether an ID exists before assigning/clearing methods. 
tcplMthdLoad(lvl = 2, id = 55, type = "mc")

## Not run: 
##D ## ACID 55 does not have any methods. Assign methods from the list above. 
##D tcplMthdAssign(lvl = 2, 
##D                id = 55, 
##D                mthd_id = c(3, 4, 2), 
##D                ordr = 1:3, 
##D                type = "mc")
##D ## Method assignment can be done for multiple assays, too. 
##D tcplMthdAssign(lvl = 2, 
##D                id = 53:54, 
##D                mthd_id = c(3, 4, 2), 
##D                ordr = 1:3, 
##D                type = "mc")
##D                
##D ## Cleanup example method assigments
##D tcplMthdClear(lvl = 2, id = 53:55, type = "mc")
## End(Not run)
## Reset configuration
options(conf_store)



