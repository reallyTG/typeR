library(icesVocab)


### Name: getCodeTypeList
### Title: Get Types
### Aliases: getCodeTypeList

### ** Examples

## Not run: 
##D # Find code type for World Register of Marine Species (WoRMS)
##D types <- getCodeTypeList()
##D types[grep("worms", tolower(types$Description)),]
##D 
##D findCodeType("worms", full = TRUE)
##D 
##D # The code type "SpecWoRMS" can be used when calling getCodeList()
## End(Not run)



