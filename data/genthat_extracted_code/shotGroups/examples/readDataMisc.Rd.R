library(shotGroups)


### Name: readDataMisc
### Title: Read data from text files
### Aliases: readDataMisc

### ** Examples

## Not run: 
##D fPath   <- 'c:/folder/files'             # folder with data files
##D fileNam <- c('pts01.txt', 'pts02.txt')   # desired files in that folder
##D DFgroup <- readDataMisc(fPath, fNames=fileNam, combine=TRUE)
##D 
##D ## alternatively, specify filename pattern for all files to be read in
##D fPath   <- 'c:/folder/otFiles'           # folder with data files
##D fPat    <- '^pts[[:digit:]]{2}\\.txt$' # filename pattern
##D DFgroup <- readDataMisc(fPath, fPat=pattern, combine=TRUE)
## End(Not run)

## result should look like this
data(DFcm)
head(DFcm)



