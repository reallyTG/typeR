library(EdSurvey)


### Name: readPIRLS
### Title: Connect to PIRLS Data
### Aliases: readPIRLS

### ** Examples

## Not run: 
##D nor <- readPIRLS("C:/PIRLS2011", countries = c("nor"))
##D gg <- getData(nor, c("itsex", "totwgt", "rrea"))
##D head(gg)
##D edsurveyTable(rrea ~ itsex, nor)
## End(Not run)



