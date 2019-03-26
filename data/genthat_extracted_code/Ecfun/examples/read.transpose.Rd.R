library(Ecfun)


### Name: read.transpose
### Title: Read a data table in transpose form
### Aliases: read.transpose
### Keywords: IO

### ** Examples

#  Find demoFiles/*.csv
demoDir <- system.file('demoFiles', package='Ecdat')
(demoCsv <- dir(demoDir, pattern='csv$', full.names=TRUE))

# Use the fourth example
# to ensure the code will handle commas in a name
# and NAs
nipa6.16D <- read.transpose(demoCsv[4])
str(nipa6.16D)



