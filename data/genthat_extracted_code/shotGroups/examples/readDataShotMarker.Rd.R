library(shotGroups)


### Name: readDataShotMarker
### Title: Read data files exported by the ShotMarker e-target system
### Aliases: readDataShotMarker

### ** Examples

## Not run: 
##D # folder with Silver Mountain e-target output files
##D fPath   <- 'c:/folder/smtFiles'
##D fileNam <- c('pts01.csv', 'pts02.csv')    # desired files in that folder
##D DFgroup <- readDataShotMarker(fPath, fNames=fileNam, combine=TRUE)
##D 
##D ## alternatively, specify filename pattern for all files to be read in
##D fPath   <- 'c:/folder/smtFiles'           # folder with data files
##D fPat    <- '^pts[[:digit:]]{2}\\.csv$'    # filename pattern
##D DFgroup <- readDataShotMarker(fPath, fPat=pattern, combine=TRUE)
## End(Not run)

## result should look like this
data(DFcm)
head(DFcm)



