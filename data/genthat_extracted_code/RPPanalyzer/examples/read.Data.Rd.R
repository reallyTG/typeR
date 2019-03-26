library(RPPanalyzer)


### Name: read.Data
### Title: Read and Annotate RPPA rawdata
### Aliases: read.Data
### Keywords: manip

### ** Examples

## Not run: 
##D   library(RPPanalyzer)
##D   
##D   
##D   dataDir <- system.file("extdata", package="RPPanalyzer")
##D   setwd(dataDir)
##D   rawdata <- read.Data(blocksperarray=12, spotter="aushon", printFlags=FALSE, remove_flagged=NULL)
##D   print(dim(rawdata$expression))
##D   
##D   rawdata <- read.Data(blocksperarray=12, spotter="aushon", printFlags=FALSE, remove_flagged=50)
##D   print(dim(rawdata$expression))
##D   
## End(Not run)
  
  


