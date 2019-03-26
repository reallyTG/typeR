library(EdSurvey)


### Name: readPISA
### Title: Connect to PISA Data
### Aliases: readPISA

### ** Examples

## Not run: 
##D # The following call returns an edsurvey.data.frame to 
##D # PISA 2012 International Database for Singapore
##D sgp2012 <- readPISA(path = "C:/PISA/2012", database = "INT", countries = "sgp")
##D 
##D # Extract a data.frame with a few variables
##D gg <- getData(sgp2012, c("cnt","read","w_fstuwt"))  
##D head(gg)
##D 
##D # Conduct a preliminary analysis on the edsurvey.data.frame
##D edsurveyTable(read ~ st04q01 + st20q01, data = sgp2012)
## End(Not run)




