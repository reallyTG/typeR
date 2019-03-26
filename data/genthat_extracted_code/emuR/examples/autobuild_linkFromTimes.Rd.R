library(emuR)


### Name: autobuild_linkFromTimes
### Title: Autobuild links between two levels using their time information
### Aliases: autobuild_linkFromTimes
### Keywords: autobuild emuR

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded myTGcolDB emuDB 
##D # (see ?create_emuRdemoData, ?convert_TextGridCollection, 
##D #  and vignette(emuR_intro) for more information)
##D 
##D # add linkDefinition as one has to be present for
##D # the autobuild function to work
##D add_linkDefinition(emuDBhandle = myTGcolDB, 
##D                    type = "ONE_TO_MANY",
##D                    superlevelName = "Syllable",
##D                    sublevelName = "Phoneme")
##D   
##D # envoke autobuild function to build hierarchy for converted TextGridCollection
##D autobuild_linkFromTimes(emuDBhandle = myTGcolDB, 
##D                         superlevelName = "Syllable",
##D                         sublevelName = "Phoneme",
##D                         convertSuperlevel = TRUE)
##D 
## End(Not run)



