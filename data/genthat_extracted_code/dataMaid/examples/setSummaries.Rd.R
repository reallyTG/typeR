library(dataMaid)


### Name: setSummaries
### Title: Set summary arguments for makeDataReport
### Aliases: setSummaries

### ** Examples

#Don't include central value (median/mode) summary for numerical and integer
#variables:
  setSummaries(numeric = defaultNumericSummaries(remove = "centralValue"),
    integer = defaultIntegerSummaries(remove = "centralValue"))
  
     
#Used in a call to makeDataReport():
## Not run: 
##D data(toyData)
##D makeDataReport(toyData, 
##D   setSummaries(numeric = defaultNumericSummaries(remove = "centralValue"),
##D     integer = defaultIntegerSummaries(remove = "centralValue")), replace = TRUE)
## End(Not run)
     



