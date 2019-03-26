library(colorSpec)


### Name: readCGATS
### Title: read tables from files in ANSI/CGATS.17 format
### Aliases: readCGATS
### Keywords: colorSpec

### ** Examples

#   read file with 2 tables of non-spectral data
A70 = readSpectra( system.file( "tests/A70.ti3", package='colorSpec' ) )
length(A70)         # [1] 2   # the file has 2 tables
ncol( A70[[1]] )    # [1] 7   # the 1st table has 7 columns
ncol( A70[[2]] )    # [1] 4   # the 2nd table has 4 columns



