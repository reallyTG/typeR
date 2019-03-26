library(futile.matrix)


### Name: read.matrix
### Title: Read a sparse matrix from a file and return a matrix
### Aliases: read.matrix
### Keywords: array

### ** Examples

## Not run: 
##D   path <- system.file('sample-data/triplet.csv', package='futile.matrix')
##D   m <- read.matrix(path)
##D 
##D   rows <- paste('row', 1:10000, sep='.')
##D   cols <- paste('col', 1:10000, sep='.')
##D   n <- read.matrix(path, row.ids=rows, col.ids=cols)
## End(Not run)



