library(R.utils)


### Name: readTableIndex
### Title: Reads a single column from file in table format
### Aliases: readTableIndex.default readTableIndex
### Keywords: IO

### ** Examples
## Not run: 
##D    # File containing data table to be access many times
##D    filename <- "somefile.txt"
##D 
##D    # Create a look-up index
##D    index <- readTableIndex(filename)
##D 
##D    # Keys of interest
##D    keys <- c("foo", "bar", "wah")
##D 
##D    # Read only those keys and do it fast
##D    df <- readTable(filename, rows=match(keys, index))
## End(Not run)


