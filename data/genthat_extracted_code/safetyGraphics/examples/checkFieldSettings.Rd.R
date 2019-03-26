library(safetyGraphics)


### Name: checkFieldSettings
### Title: Check that a setting parameter has a matching data field
### Aliases: checkFieldSettings

### ** Examples

testSettings<-generateSettings(standard="AdAM")

#list of 4 checks. all pass ($valid ==TRUE)
safetyGraphics:::checkFieldSettings(fieldKey=list("measure_values"),
                                    settings=testSettings, adlbc) 




