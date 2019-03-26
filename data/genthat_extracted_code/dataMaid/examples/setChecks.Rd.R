library(dataMaid)


### Name: setChecks
### Title: Set check arguments for makeDataReport
### Aliases: setChecks

### ** Examples

#Only identify missing values for characters, logicals and labelled variables:
  setChecks(character = "identifyMissing", factor = "identifyMissing", 
     labelled = "identifyMissing")
     
#Used in a call to makeDataReport():
## Not run: 
##D data(toyData)
##D makeDataReport(toyData, checks = setChecks(character = "identifyMissing", 
##D    factor = "identifyMissing", labelled = "identifyMissing"), replace = TRUE)
## End(Not run)
     



