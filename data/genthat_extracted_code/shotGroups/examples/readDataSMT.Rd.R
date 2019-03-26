library(shotGroups)


### Name: readDataSMT
### Title: Read data files exported by the Silver Mountain e-target system
### Aliases: readDataSMT

### ** Examples

## Not run: 
##D # folder with Silver Mountain e-target output files
##D fPath   <- 'c:/folder/smtFiles'
##D fileNam <- c('pts01.csv', 'pts02.csv')    # desired files in that folder
##D DFgroup <- readDataSMT(fPath, fNames=fileNam, combine=TRUE)
##D 
##D ## alternatively, specify filename pattern for all files to be read in
##D fPath   <- 'c:/folder/smtFiles'           # folder with data files
##D fPat    <- '^pts[[:digit:]]{2}\\.csv$'    # filename pattern
##D DFgroup <- readDataSMT(fPath, fPat=pattern, combine=TRUE)
## End(Not run)

## result should look like this
data(DFcm)
head(DFcm)



