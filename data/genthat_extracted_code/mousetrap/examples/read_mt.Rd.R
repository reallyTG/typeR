library(mousetrap)


### Name: read_mt
### Title: Read MouseTracker raw data.
### Aliases: read_mt

### ** Examples

## Not run: 
##D # Read a single raw data file from MouseTracker
##D # (stored in the current working directory)
##D mt_data_raw <- read_mt("example.mt")
##D 
##D # Use read_bulk to read all raw data files ending with ".mt" that are
##D # stored in the folder "raw_data" (in the current working directory)
##D library(readbulk)
##D mt_data_raw <- read_bulk("raw_data", fun=read_mt, extension=".mt")
##D 
##D # Import the data into mousetrap
##D mt_data <- mt_import_wide(mt_data_raw)
## End(Not run)





