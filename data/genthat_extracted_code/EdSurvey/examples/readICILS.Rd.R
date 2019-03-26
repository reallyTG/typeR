library(EdSurvey)


### Name: readICILS
### Title: Connect to ICILS Data
### Aliases: readICILS

### ** Examples

## Not run: 
##D pol <- readICILS("C:/ICILS/2013", countries = "pol", dataSet = "student")
##D gg <- getData(pol, c("idstud", "cil", "is1g18b"))
##D head(gg)
##D edsurveyTable(cil ~ is1g18b, pol)
## End(Not run)



