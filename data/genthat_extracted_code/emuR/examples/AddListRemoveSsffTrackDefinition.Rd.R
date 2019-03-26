library(emuR)


### Name: AddListRemoveSsffTrackDefinition
### Title: Add / List / Remove ssffTrackDefinition to / from / of emuDB
### Aliases: AddListRemoveSsffTrackDefinition add_ssffTrackDefinition
###   list_ssffTrackDefinitions remove_ssffTrackDefinition

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D # add ssff track definition to ae emuDB
##D # calculating the according SSFF files (.zcr) on-the-fly
##D # using the wrassp function "zcrana" (zero-crossing-rate analysis)
##D add_ssffTrackDefinition(emuDBhandle = ae,
##D                         name = "ZCRtrack",
##D                         onTheFlyFunctionName = "zcrana")
##D                         
##D # add ssff track definition to ae emuDB
##D # for SSFF files that will be added later (either
##D # by adding files to the emuDB using 
##D # the add_files() function or by calculating
##D # them using the according function provided 
##D # by the wrassp package)
##D add_ssffTrackDefinition(emuDBhandle = ae,
##D                         name = "formants",
##D                         columnName = "fm",
##D                         fileExtension = "fms")
##D 
##D # list ssff track definitions for ae emuDB
##D list_ssffTrackDefinitions(emuDBhandle = ae)
##D 
##D # remove newly added ssff track definition (does not delete 
##D # the actual .zrc files)
##D remove_ssffTrackDefinition <- function(emuDBhandle = ae, 
##D                                        name = "ZCRtrack")
##D 
## End(Not run)




