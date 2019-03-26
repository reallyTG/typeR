library(emuR)


### Name: AddListRemoveLabelGroup
### Title: Add / List / Remove global labelGroup to / of / from emuDB
### Aliases: AddListRemoveLabelGroup add_labelGroup list_labelGroups
###   remove_labelGroup
### Keywords: Emu database emuDB schema

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D sampaNasals = c("m", "F", "n", "J", "N")
##D 
##D # add these values to the ae emuDB
##D # as a globally available labelGroup
##D add_labelGroup(emuDBhandle = ae,
##D                name = "sampaNasals",
##D                values = sampaNasals)
##D 
##D # query the labelGroup in the "Phonetic" level
##D query(emuDBhandle = ae, 
##D       query = "Phonetic == sampaNasals")
##D 
##D # query the labelGroup in the "Phoneme" level
##D query(emuDBhandle = ae, 
##D       query = "Phoneme == sampaNasals")
##D 
##D # list global label groups of ae emuDB
##D list_labelGroups(emuDBhandle = ae)
##D 
##D # remove the newly added labelGroup
##D remove_labelGroup(emuDBhandle = ae,
##D                   name = "sampaNasals")
## End(Not run)




