library(fda)


### Name: dirs
### Title: Get subdirectories
### Aliases: dirs dirs dirs
### Keywords: IO

### ** Examples

path2fdaM <- system.file('Matlab/fdaM', package='fda')
dirs(path2fdaM)
dirs(path2fdaM, full.names=TRUE)
dirs(path2fdaM, recursive=TRUE)
dirs(path2fdaM, exclude='^@|^private$', recursive=TRUE)

# Directories to add to Matlab path
# for R.matlab and fda
R.matExt <- system.file('externals', package='R.matlab')
fdaM <- dirs(path2fdaM, exclude='^@|^private$', full.names=TRUE,
              recursive=TRUE)  
add2MatlabPath <- c(R.matExt, path2fdaM, fdaM) 




