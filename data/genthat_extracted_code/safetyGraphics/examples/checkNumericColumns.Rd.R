library(safetyGraphics)


### Name: checkNumericColumns
### Title: Check that settings for mapping numeric data are associated with
###   numeric columns
### Aliases: checkNumericColumns

### ** Examples

testSettings<-generateSettings(standard="AdAM")
#pass ($valid == TRUE)
safetyGraphics:::checkSettingProvided(key=list("id_col"),settings=testSettings) 

#fails since filters aren't specified by default
safetyGraphics:::checkSettingProvided(key=list("filters"),settings=testSettings) 

#fails since groups aren't specified by default
safetyGraphics:::checkSettingProvided(key=list("groups",1,"value_col"),settings=testSettings) 




