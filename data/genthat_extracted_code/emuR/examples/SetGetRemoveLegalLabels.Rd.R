library(emuR)


### Name: SetGetRemoveLegalLabels
### Title: Set / Get / Remove legal labels of attributeDefinition of emuDB
### Aliases: SetGetRemoveLegalLabels set_legalLabels get_legalLabels
###   remove_legalLabels
### Keywords: Emu database emuDB schema

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D legalPhoneticLabels = c("V", "m", "N", "s", "t", "H", "@:", "f", "r", 
##D                         "E", "n", "z", "S", "i:", "w", "@", "k", "I", "d", 
##D                         "db", "j", "u:", "dH", "l", "ai", "O", "D", "o:", "v")
##D 
##D # set legal labels of the 
##D # default "Phonetic" attributeDefinition of
##D # the "Phonetic" level of ae emuDB
##D set_legalLabels(emuDBhandle = ae, 
##D                 levelName = "Phonetic",
##D                 attributeDefinitionName = "Phonetic",
##D                 legalLabels = legalPhoneticLabels)
##D 
##D # get legal labels of the 
##D # default "Phonetic" attributeDefinition of
##D # the "Phonetic" level of ae emuDB
##D get_legalLabels(emuDBhandle = ae, 
##D                 levelName = "Phonetic", 
##D                 attributeDefinitionName = "Phonetic")
##D                 
##D 
##D # remove legal labels of the 
##D # default "Phonetic" attributeDefinition of
##D # the "Phonetic" level of ae emuDB
##D remove_legalLabels(emuDBhandle = ae, 
##D                    levelName = "Phonetic", 
##D                    attributeDefinitionName = "Phonetic")
##D                 
## End(Not run)




