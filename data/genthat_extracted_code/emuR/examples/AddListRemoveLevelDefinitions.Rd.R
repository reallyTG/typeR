library(emuR)


### Name: AddListRemoveLevelDefinitions
### Title: Add / List / Remove level definition to / of / from emuDB
### Aliases: AddListRemoveLevelDefinitions add_levelDefinition
###   list_levelDefinitions remove_levelDefinition
### Keywords: Emu database emuDB schema

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D # add level called "Phonetic2" to the ae emuDB
##D # that could for example contain the transcriptions of a second annotator
##D add_levelDefinition(emuDBhandle = ae,
##D                     name = "Phonetic2",
##D                     type = "SEGMENT")
##D                     
##D # list level definition of ae emuDB
##D list_levelDefinitions(emuDBhandle = ae)
##D 
##D # remove newly added level definition
##D remove_levelDefinitions(emuDBhandle = ae,
##D                         name = "Phonetic2")
## End(Not run)




