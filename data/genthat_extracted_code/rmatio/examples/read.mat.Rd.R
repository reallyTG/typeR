library(rmatio)


### Name: read.mat
### Title: Read Matlab file
### Aliases: read.mat

### ** Examples

## Not run: 
##D library(rmatio)
##D 
##D ## Read a version 4 MAT file with little-endian byte ordering
##D filename <- system.file('extdata/matio_test_cases_v4_le.mat', package='rmatio')
##D m <- read.mat(filename)
##D 
##D ## View content
##D str(m)
##D 
##D ## Read a version 4 MAT file with big-endian byte ordering.
##D filename <- system.file('extdata/matio_test_cases_v4_be.mat', package='rmatio')
##D m <- read.mat(filename)
##D 
##D ## View content
##D str(m)
##D 
##D ## Read a compressed version 5 MAT file
##D filename <- system.file('extdata/matio_test_cases_compressed_le.mat', package='rmatio')
##D m <- read.mat(filename)
##D 
##D ## View content
##D str(m)
##D 
##D ## Read a compressed version 5 MAT file
##D url <- paste("http://sourceforge.net/p/matio/matio_test_datasets/ci/",
##D              "master/tree/matio_test_cases_compressed_le.mat?format=raw",
##D              sep="")
##D m <- read.mat(url)
##D 
##D ## View content
##D str(m)
## End(Not run)



