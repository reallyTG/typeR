library(shotGroups)


### Name: readDataOT1
### Title: Read data files exported by OnTarget PC v1.1*
### Aliases: readDataOT1

### ** Examples

## Not run: 
##D # folder with OnTarget PC v1.1* output files
##D fPath   <- 'c:/folder/otFiles'
##D fileNam <- c('pts01.txt', 'pts02.txt')   # desired files in that folder
##D DFgroup <- readDataOT1(fPath, fNames=fileNam)
##D 
##D ## alternatively, specify filename pattern for all files to be read in
##D fPath   <- 'c:/folder/otFiles'           # folder with data files
##D fPat    <- '^pts[[:digit:]]{2}\\.txt$' # filename pattern
##D DFgroup <- readDataOT1(fPath, fPat=pattern)
## End(Not run)

## result should look like this
data(DFcm)
head(DFcm)



