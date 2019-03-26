library(emuR)


### Name: AddListRenameRemoveAttributeDefinitions
### Title: Add / List / Rename / Remove attribute definition to / of / from
###   emuDB
### Aliases: AddListRenameRemoveAttributeDefinitions
###   add_attributeDefinition list_attributeDefinitions
###   rename_attributeDefinition remove_attributeDefinition
### Keywords: DBconfig Emu database emuDB

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D # add additional attribute definition to the "Phonetic" level
##D # of the ae emuDB that will contain the UTF8 IPA
##D # symbols of the phonetic transcriptions
##D add_attributeDefinition(emuDBhandle = ae,
##D                         levelName = "Phonetic",
##D                         name = "IPA-UTF8")
##D                         
##D # list attribute definitions for level "Word"
##D # of the ae emuDB
##D list_attributeDefinitions(emuDBhandle = ae, 
##D                           levelName = "Word")
##D 
##D # remove newly added attributeDefinition
##D remove_attributeDefinition(emuDBhandle = ae,
##D                            levelName = "Phonetic",
##D                            name = "IPA-UTF8")
## End(Not run)




