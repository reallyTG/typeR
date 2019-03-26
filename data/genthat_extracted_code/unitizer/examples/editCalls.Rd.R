library(unitizer)


### Name: editCalls
### Title: Edit Calls In Unitizer
### Aliases: editCalls editCalls,unitizer,language,language-method

### ** Examples

## Not run: 
##D untz <- get_unitizer("tests/unitizer/mytests.unitizer")
##D untz.edited <- editCalls(untz, quote(myFun), quote(my_fun))
##D set_unitizer("tests/unitizer/mytests.unitizer", untz.edited)
## End(Not run)



