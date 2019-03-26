library(emuR)


### Name: AddListRemovePerspective
### Title: Add / List / Remove perspective to / of / from emuDB
### Aliases: AddListRemovePerspective add_perspective list_perspectives
###   remove_perspective
### Keywords: DBconfig Emu database emuDB

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D # add perspective called "justTones" to the ae emuDB
##D add_perspective(emuDBhandle = ae,
##D                 name = "justTones") 
##D                 
##D # add levelCanvasOrder so only the "Tone" level is displayed
##D set_levelCanvasesOrder(emuDBhandle = ae, 
##D                        perspectiveName = "justTones", 
##D                        order = c("Tone"))
##D 
##D # list perspectives of ae emuDB
##D list_perspectives(emuDBhandle = ae)
##D 
##D # remove newly added perspective
##D remove_perspective(emuDBhandle = ae,
##D                    name = "justTones")
##D                    
## End(Not run)




