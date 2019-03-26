library(APSIMBatch)


### Name: runAPSIM
### Title: Run APSIM with HPC...
### Aliases: runAPSIM

### ** Examples
# NO RUN
# Run all sim files
## Not run: files <- list.files( "./simtest", pattern = "(.*)(\.sim$)", full.names = TRUE )
## Not run: runAPSIM( files = files )
# Run Rdata file
## Not run: runAPSIM( files = "test.RData" )
# Set apsim path
## Not run: apsim <- "\"C:/Program Files/Apsim71/Model/apsim.exe\""
## Not run: runAPSIM( files = "test.RData", apsim = apsim )


