library(EdSurvey)


### Name: readCivEDICCS
### Title: Connect to ICCS and CivED Data
### Aliases: readCivEDICCS

### ** Examples

## Not run: 
##D eng <- readCivEDICCS("C:/ICCS2009/Gr8", countries = c("eng"),
##D                      gradeLvl = 8, dataSet = "student")
##D gg <- getData(eng, c("famstruc", "totwgts", "civ"))
##D head(gg)
##D edsurveyTable(civ ~ famstruc, eng)
## End(Not run)



