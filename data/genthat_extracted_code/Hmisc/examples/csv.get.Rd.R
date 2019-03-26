library(Hmisc)


### Name: csv.get
### Title: Read Comma-Separated Text Data Files
### Aliases: csv.get
### Keywords: manip IO file

### ** Examples

## Not run: 
##D dat <- csv.get('myfile.csv')
##D 
##D # Read a csv file with junk in the first row, variable names in the
##D # second, long variable labels in the third, and junk in the 4th row
##D dat <- csv.get('myfile.csv', vnames=2, labels=3, skip=4)
## End(Not run)



