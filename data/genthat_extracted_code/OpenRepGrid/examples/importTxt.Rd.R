library(OpenRepGrid)


### Name: importTxt
### Title: Import grid data from a text file.
### Aliases: importTxt

### ** Examples

## Not run: 
##D 
##D # using the pop-up selection menu
##D rg <- importTxt()   
##D 
##D # supposing that the data file sample.txt is in the current directory
##D file <- "sample.txt"
##D rg <- importTxt(file)
##D 
##D # specifying a directory (arbitrary example directory)
##D dir <- "/Users/markheckmann/data"
##D rg <- importTxt(file, dir)
##D 
##D # using a full path
##D rg <- importTxt("/Users/markheckmann/data/sample.txt")
##D 
##D # load .txt data from URL
##D rg <- importTxt("http://www.openrepgrid.uni-bremen.de/data/sample.txt")
##D 
##D # importing more than one .txt file via R code
##D files <- c("sample.txt", "sample_2.txt")
##D rg <- importTxt(files)
## End(Not run)




