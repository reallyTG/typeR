library(EdSurvey)


### Name: readTIMSS
### Title: Connect to TIMSS Data
### Aliases: readTIMSS

### ** Examples

## Not run: 
##D #single country specified
##D fin <- readTIMSS("C:/TIMSS2015", countries = c("fin"), gradeLvl = 4)
##D gg <- getData(fin, c("asbg01", "totwgt", "srea"))
##D head(gg)
##D edsurveyTable(srea ~ asbg01, fin)
##D 
##D #multiple countries returned as edsurvey.data.frame.list, specify all countries with '*' argument
##D timss2011 <- readTIMSS("C:/TIMSS2011", countries="*", gradeLvl = 8, verbose = TRUE)
##D #print out edsurvey.data.frame.list covariates
##D timss2011$covs
## End(Not run)



