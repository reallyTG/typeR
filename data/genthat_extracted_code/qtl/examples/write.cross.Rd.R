library(qtl)


### Name: write.cross
### Title: Write data for a QTL experiment to a file
### Aliases: write.cross
### Keywords: IO

### ** Examples

## Not run: 
##D data(fake.bc)
##D 
##D # comma-delimited format
##D write.cross(fake.bc, "csv", "Data/fakebc", c(1,5,13))
##D 
##D # rotated comma-delimited format
##D write.cross(fake.bc, "csvr", "Data/fakebc", c(1,5,13))
##D 
##D # split comma-delimited format
##D write.cross(fake.bc, "csvs", "Data/fakebc", c(1,5,13))
##D 
##D # split and rotated comma-delimited format
##D write.cross(fake.bc, "csvsr", "Data/fakebc", c(1,5,13))
##D 
##D # Mapmaker format
##D write.cross(fake.bc, "mm", "Data/fakebc", c(1,5,13))
##D 
##D # QTL Cartographer format
##D write.cross(fake.bc, "qtlcart", "Data/fakebc", c(1,5,13))
##D 
##D # Gary's format
##D write.cross(fake.bc, "gary", c(1,5,13))
## End(Not run) 


