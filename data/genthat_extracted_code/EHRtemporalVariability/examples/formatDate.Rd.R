library(EHRtemporalVariability)


### Name: formatDate
### Title: Function to transform dates into "Date" R format
### Aliases: formatDate

### ** Examples


dataset <- read.csv2(system.file("extdata",
                                   "nhdsSubset.csv",
                                   package="EHRtemporalVariability"), 
                     sep  = ",",
                     header = TRUE, 
                     na.strings = "", 
                     colClasses = c( "character", "numeric", "factor",
                                     "numeric" , rep( "factor", 22 ) ) )
                     
datasetFormatted <- formatDate( 
              input         = dataset, 
              dateColumn    = "date", 
              dateFormat    = "%y/%m",
             )



