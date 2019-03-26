library(EHRtemporalVariability)


### Name: DataTemporalMap-class
### Title: Class DataTemporalMap
### Aliases: DataTemporalMap-class

### ** Examples

## Not run: 
##D 
##D # Generation through estimateDataTemporalMap function:
##D dataset <- read.csv2(system.file("extdata",
##D                                    "nhdsSubset.csv",
##D                                    package="EHRtemporalVariability"), 
##D                      sep  = ",",
##D                      header = TRUE, 
##D                      na.strings = "", 
##D                      colClasses = c( "character", "numeric", "factor",
##D                                      "numeric" , rep( "factor", 22 ) ) )
##D 
##D datasetFormatted <- EHRtemporalVariability::formatDate(
##D                      input         = dataset,
##D                      dateColumn    = "date",
##D                      dateFormat = "%y/%m")
##D 
##D probMaps <- estimateDataTemporalMap(data = datasetPheWAS, 
##D                      dateColumnName = "date", 
##D                      period         = "month")
##D 
##D class( probMaps[[1]] ) 
##D 
##D # Manual generation:
##D countsMatrix <- matrix(sample.int(25, size = 12*10, replace = TRUE), nrow = 12, ncol = 10)
##D probabilityMatrix <- sweep(countsMatrix,1,rowSums(countsMatrix),"/")
##D dates <- seq(Sys.Date(),(Sys.Date()+30*12),30)
##D x <- DataTemporalMap(probabilityMap = probabilityMatrix, 
##D countsMap = countsMatrix, dates = dates, support = as.matrix(1:25), 
##D variableName = "example", variableType = "numerical", period = "month")
## End(Not run)



