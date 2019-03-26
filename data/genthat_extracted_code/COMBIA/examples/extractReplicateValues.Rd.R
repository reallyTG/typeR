library(COMBIA)


### Name: extractReplicateValues
### Title: This function will takes a list of ranges removes case wells and
###   extract replicate values separately
### Aliases: extractReplicateValues

### ** Examples

dataFile <- system.file("extdata", "testData.csv", package="COMBIA")
rData <- read.csv( dataFile, skip=0, sep=",", nrows=41, 
                    fill=TRUE, header=FALSE,
                    blank.lines.skip = FALSE)[,1:13]
wellR= c( "l3:l10","m3:m10","b3:k10",  "l13:l20","m13:m20","b13:k20", 
            "l23:l30","m23:m30","b23:k30",  "l33:l40","m33:m40","b33:k40")
rslt <-  extractReplicateValues(rData, wellR, excelFormate=TRUE )



