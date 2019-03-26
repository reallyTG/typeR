library(OpenRepGrid)


### Name: importExcel
### Title: Import grid data from an Excel file.
### Aliases: importExcel

### ** Examples

## Not run: 
##D 
##D # Open Excel file delivered along with the package
##D file <- system.file("extdata", "grid_01.xlsx", package = "OpenRepGrid")
##D rg <- importExcel(file)
##D 
##D # To see the structure of the Excel file try to open it as follows.
##D # Requires Excel to be installed.
##D system2("open", file)
##D 
##D # Import more than one Excel file
##D files <- system.file("extdata", c("grid_01.xlsx", "grid_02.xlsx") , package = "OpenRepGrid")
##D rg <- importExcel(files)
##D 
## End(Not run)




