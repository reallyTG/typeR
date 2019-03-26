library(shotGroups)


### Name: readDataOT2
### Title: Read data files exported by OnTarget PC v2.* or OnTarget TDS
###   v3.*
### Aliases: readDataOT2

### ** Examples

## Not run: 
##D # folder with OnTarget PC v2.* or OnTarget TDS v3.* output files
##D fPath   <- 'c:/folder/otFiles'
##D fileNam <- c('pts01.csv', 'pts02.csv')   # desired files in that folder
##D DFgroup <- readDataOT2(fPath, fNames=fileNam, combine=TRUE)
##D 
##D ## alternatively, specify filename pattern for all files to be read in
##D fPath   <- 'c:/folder/otFiles'            # folder with data files
##D fPat    <- '^pts[[:digit:]]{2}\\.txt$'  # filename pattern
##D DFgroup <- readDataOT2(fPath, fPat=pattern, combine=TRUE)
## End(Not run)

## result should look like this
data(DFcm)
head(DFcm)



