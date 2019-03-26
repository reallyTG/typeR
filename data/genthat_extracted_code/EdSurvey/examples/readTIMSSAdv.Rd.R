library(EdSurvey)


### Name: readTIMSSAdv
### Title: Connect to TIMSS Advanced Data
### Aliases: readTIMSSAdv

### ** Examples

## Not run: 
##D swe <- readTIMSSAdv("C:/TIMSSAdvanced/Math/2015",
##D                     countries = c("swe"), subject = "math")
##D gg <- getData(swe, c("itsex", "totwgt", "malg"))
##D head(gg)
##D edsurveyTable(malg ~ itsex, swe)
## End(Not run)



