library(safetyGraphics)


### Name: checkSettingProvided
### Title: Check that the user has provided a valid for a given settings
###   parameter
### Aliases: checkSettingProvided

### ** Examples

testSettings<-generateSettings(standard="AdAM")

#pass ($valid == TRUE)
safetyGraphics:::checkSettingProvided(key=list("id_col"),
                                      settings=testSettings) 

#fails since filters aren't specified by default
safetyGraphics:::checkSettingProvided(key=list("filters"),
                                      settings=testSettings) 

#fails since groups aren't specified by default
safetyGraphics:::checkSettingProvided(key=list("groups",1,"value_col"),
                                      settings=testSettings) 




