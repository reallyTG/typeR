library(safetyGraphics)


### Name: getSettingValue
### Title: Retrieve the value for a given named parameter
### Aliases: getSettingValue

### ** Examples

safetyGraphics:::getSettingValue(list("a","b"),list(a=list(b="myValue"))) #returns "myValue"

testSettings<-generateSettings(standard="AdAM")
safetyGraphics:::getSettingValue(list("id_col"),testSettings) 
safetyGraphics:::getSettingValue(list("measure_values","ALP"),testSettings)
safetyGraphics:::getSettingValue(list("NotASetting"),testSettings) #returns NULL




