library(trajr)


### Name: TrajsBuild
### Title: Construct multiple trajectories
### Aliases: TrajsBuild

### ** Examples

## Not run: 
##D # Names of CSV files containing trajectory coordinates
##D fileNames <- c('xy001.csv', 'xy003.csv', 'xy004.csv')
##D # The files are all located somewhere under this directory
##D rootDir <- '.'
##D # Scale for these files is 1 / pixels per metre
##D scale <- c('1/1200', '1/1350', '1/1300')
##D # Files have columns y, x
##D csvStruct <- list(x = 2, y = 1)
##D # Apply default smoothing, and the files are formatted as conventional CSV,
##D # so there's no need to specify csvReadFn
##D trjs <- TrajsBuild(fileNames, fps = 50, scale = scale, units = "m",
##D                    csvStruct = csvStruct, rootDir = rootDir)
## End(Not run)




