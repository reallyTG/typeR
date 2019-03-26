library(EHRtemporalVariability)


### Name: icd9toPheWAS
### Title: Function to transform ICD9-CM codification into PheWAS code
### Aliases: icd9toPheWAS

### ** Examples

dataset <- read.csv2(system.file("extdata",
                                   "nhdsSubset.csv",
                                   package="EHRtemporalVariability"), 
                     sep  = ",",
                     header = TRUE, 
                     na.strings = "", 
                     colClasses = c( "character", "numeric", "factor",
                                     "numeric" , rep( "factor", 22 ) ) )

datasetPheWAS <- icd9toPheWAS( data           = dataset,
                              icd9ColumnName  = "diagcode1", 
                              missingValues   = "N/A", 
                              statistics      = TRUE 
                              )



