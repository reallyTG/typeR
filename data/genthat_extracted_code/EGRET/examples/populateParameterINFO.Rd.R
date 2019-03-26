library(EGRET)


### Name: populateParameterINFO
### Title: Populate Parameter Information Columns
### Aliases: populateParameterINFO

### ** Examples

## Not run: 
##D library(dataRetrieval)
##D INFO <- readNWISsite('01594440')
##D parameterCd <- "01075"
##D parameterData <- readNWISpCode(parameterCd)
##D INFO$param.nm <- parameterData$parameter_nm
##D INFO$param.units <- parameterData$parameter_units
##D INFO$paramShortName <- parameterData$srsname
##D INFO$paramNumber <- parameterData$parameter_cd
##D 
##D INFO <- populateParameterINFO(parameterCd, INFO)
## End(Not run)



