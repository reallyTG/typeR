library(emuR)


### Name: convert_TextGridCollection
### Title: Convert a TextGridCollection (e.g. .wav & .TextGrid files) to
###   emuDB
### Aliases: convert_TextGridCollection

### ** Examples

## Not run: 
##D 
##D ##########################################################
##D # prerequisite: directory containing .wav & .TextGrid files
##D # (see \code{?create_emuRdemoData} how to create demo data)
##D 
##D # convert TextGridCollection and store 
##D # new emuDB in folder provided by tempdir()
##D convert_TextGridCollection(dir = "/path/to/directory/",
##D                            dbName = "myTGcolDB",
##D                            targetDir = tempdir())
##D 
##D 
##D # same as above but this time only convert 
##D # the information stored in the "Syllable" and "Phonetic" tiers
##D convert_TextGridCollection(dir = "/path/to/directory/", 
##D                            dbName = "myTGcolDB", 
##D                            targetDir = tempdir(),
##D                            tierNames = c("Syllable", "Phonetic"))
##D 
## End(Not run) 



