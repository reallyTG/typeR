library(EdSurvey)


### Name: read_ePIRLS
### Title: Connect to ePIRLS Data
### Aliases: read_ePIRLS

### ** Examples

## Not run: 
##D usa <- read_ePIRLS("C:/ePIRLS/2016", countries = c("usa"))
##D gg <- getData(usa, c("itsex", "totwgt", "erea"))
##D head(gg)
##D edsurveyTable(erea ~ itsex, usa)
## End(Not run)



