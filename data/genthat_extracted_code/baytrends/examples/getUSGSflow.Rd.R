library(baytrends)


### Name: getUSGSflow
### Title: Retrieve USGS daily flow data in a wide format
### Aliases: getUSGSflow
### Keywords: internal

### ** Examples

# set retrieval parameters
yearStart   <- 2014
yearEnd     <- 2014
siteNumber <- c('01578310')

# regular retrieval (default usage)
df <- getUSGSflow(siteNumber, yearStart, yearEnd)




