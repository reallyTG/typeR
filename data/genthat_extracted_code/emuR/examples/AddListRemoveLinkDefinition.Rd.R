library(emuR)


### Name: AddListRemoveLinkDefinition
### Title: Add / List / Remove linkDefinition to / of / from emuDB
### Aliases: AddListRemoveLinkDefinition add_linkDefinition
###   list_linkDefinitions remove_linkDefinition

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded emuDB that was converted
##D # using the convert_TextGridCollection function called myTGcolDB
##D # (see ?load_emuDB and ?convert_TextGridCollection for more information)
##D 
##D # add link definition from super-level "Phoneme"
##D # to sub-level "Phonetic" of type "ONE_TO_MANY"
##D # for myTGcolDB emuDB
##D add_linkDefinition(emuDBhandle = myTGcolDB,
##D                    type = "ONE_TO_MANY",
##D                    superlevelName = "Phoneme",
##D                    sublevelName = "Phonetic")
##D 
##D # list link definitions for myTGcolDB emuDB
##D list_linkDefinitions(emuDBhandle = myTGcolDB)
##D 
##D # remove newly added link definition
##D remove_linkDefinition(emuDBhandle = myTGcolDB,
##D                       superlevelName = "Phoneme",
##D                       sublevelName = "Phonetic")
##D 
##D 
## End(Not run)



