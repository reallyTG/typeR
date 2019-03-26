library(emuR)


### Name: AddListRemoveAttrDefLabelGroup
### Title: Add / List / Remove labelGroup to / of / from
###   attributeDefinition of emuDB
### Aliases: AddListRemoveAttrDefLabelGroup add_attrDefLabelGroup
###   list_attrDefLabelGroups remove_attrDefLabelGroup
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
##D # add these values to the default Phonetic attribute
##D # definition of the Phonetic level of the ae emuDB
##D add_attrDefLabelGroup(emuDBhandle = ae,
##D                       levelName = "Phonetic",
##D                       attributeDefinitionName = "Phonetic",
##D                       labelGroupName = "sampaNasals",
##D                       labelGroupValues = sampaNasals)
##D 
##D # query the labelGroup
##D query(ae, "Phonetic=sampaNasals")
##D 
##D 
##D # list attribute definition label groups
##D # of attributeDefinition "Phonetic" of the level "Phonetic"
##D # of the ae emuDB
##D list_attrDefLabelGroups(emuDBhandle = ae, 
##D                         levelName = "Phonetic" , 
##D                         attributeDefinitionName = "Phonetic")
##D 
##D # remove the newly added attrDefLabelGroup
##D remove_attrDefLabelGroup(emuDBhandle = ae,
##D                          levelName = "Phonetic",
##D                          attributeDefinitionName = "Phonetic",
##D                          labelGroupName = "sampaNasals")
##D 
## End(Not run)




