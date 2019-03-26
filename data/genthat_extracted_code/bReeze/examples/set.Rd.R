library(bReeze)


### Name: set
### Title: Creation of datasets
### Aliases: set
### Keywords: methods

### ** Examples

## Not run: 
##D # load data
##D data("winddata", package="bReeze")
##D 
##D # minimal dataset
##D s <- set(height=40, v.avg=winddata[,2])
##D 
##D # detailed dataset
##D s2 <- set(height=40, desc=
##D   "C1: cup anemometer (SN: 4.3250.128), A1: wind vane (SN: 4.2800.205)", 
##D   v.avg=winddata[,2], v.max=winddata[,3], v.min=winddata[,4], 
##D   v.std=winddata[,5], dir.avg=winddata[,14], dir.std=winddata[,15])
## End(Not run)



