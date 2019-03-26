library(safetyGraphics)


### Name: generateSettings
### Title: Generate a settings object based on a data standard
### Aliases: generateSettings

### ** Examples


generateSettings(standard="SDTM") 
generateSettings(standard="SdTm") #also ok
generateSettings(standard="SDTM", partial=TRUE, partial_cols = c("USUBJID","TEST","STRESN"))
generateSettings(standard="AdAM")

generateSettings(standard="a different standard") 
#returns shell settings list with no data mapping

## Not run: 
##D generateSettings(standard="adam",chart="AEExplorer") #Throws error. Only eDish supported so far. 
## End(Not run)




