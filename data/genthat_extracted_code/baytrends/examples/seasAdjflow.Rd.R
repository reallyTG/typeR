library(baytrends)


### Name: seasAdjflow
### Title: Create Daily Seasonally-adjusted Log Flow Residuals
### Aliases: seasAdjflow
### Keywords: internal

### ** Examples

#Set Retrieval Parameters
yearStart   <- 1983
yearEnd     <- 2015
siteNumbers <- c("01578310")

# Regular Retrieval (default usage)
df <- getUSGSflow(siteNumbers, yearStart, yearEnd, fill=TRUE)
# Apply default smoothing
df <- seasAdjflow(df,"01578310")




