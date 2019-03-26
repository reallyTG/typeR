library(EHRtemporalVariability)


### Name: estimateDataTemporalMap
### Title: Estimates 'DataTemporalMap' objects from raw data
### Aliases: estimateDataTemporalMap

### ** Examples

#Load the file 
dataset <- read.csv2(system.file("extdata",
                                   "nhdsSubset.csv",
                                   package="EHRtemporalVariability"), 
                     sep  = ",",
                     header = TRUE, 
                     na.strings = "", 
                     colClasses = c( "character", "numeric", "factor",
                                     "numeric" , rep( "factor", 22 ) ) )
#Format the date
datasetFormatted <- EHRtemporalVariability::formatDate( input         = dataset,
                                            dateColumn    = "date",
                                            dateFormat    = "%y/%m")

#Apply the estimateDataTemporalMap
probMaps <- estimateDataTemporalMap( data           = datasetFormatted, 
                                     dateColumnName = "date", 
                                     period         = "month")
## Not run: 
##D 
##D For a larger example download the following .csv dataset and continue the steps as above:
##D 
##D inputFile <- "http://github.com/hms-dbmi/EHRtemporalVariability-DataExamples/raw/master/nhdsSubset.csv"
##D dataset <- read.csv2( inputFile, 
##D                      sep  = ",",
##D                      header = TRUE, 
##D                      na.strings = "", 
##D                      colClasses = c( "character", "numeric", "factor",
##D                                      "numeric" , rep( "factor", 22 ) ) ) 
## End(Not run)



