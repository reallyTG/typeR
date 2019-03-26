library(safetyGraphics)


### Name: getSettingKeys
### Title: Get setting keys matching a pattern
### Aliases: getSettingKeys

### ** Examples

testSettings<-generateSettings(standard="AdAM")

# returns list of all matching values
safetyGraphics:::getSettingKeys(patterns=c("_col"),
                                settings=testSettings)

#finds the matching nested setting 
safetyGraphics:::getSettingKeys(patterns=c("ALP"),
                                settings=testSettings) 

#returns an empty list, since the only matching item is a list
safetyGraphics:::getSettingKeys(patterns=c("measure_values"),
                                settings=testSettings) 

#finds the matching key associated with a list
safetyGraphics:::getSettingKeys(patterns=c("measure_values"),
                                settings=testSettings, 
                                matchLists=TRUE) 




