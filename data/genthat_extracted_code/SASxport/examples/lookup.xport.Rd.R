library(SASxport)


### Name: lookup.xport
### Title: Describe the Contents of an SAS XPORT File
### Aliases: lookup.xport print.lookup.xport summary.lookup.xport
###   print.summary.lookup.xport
### Keywords: file manip

### ** Examples


## Get information about a local file
alfFile <- system.file('extdata', 'Alfalfa.xpt', package='SASxport')
lookup.xport(alfFile)

## Read a copy of test2.xpt available on the web:
## Not run: 
##D url <- 'http://biostat.mc.vanderbilt.edu/wiki/pub/Main/Hmisc/test2.xpt'
##D w <- lookup.xport(url)
## End(Not run)
## Or use the local copy...
testFile <- system.file('extdata', 'test2.xpt', package="SASxport")
w <- lookup.xport(testFile)


# display the information (calls 'print.lookup.xport')
w

# names of data sets
names(w)

# names of variables within data sets
w$Z$name

# use summary
wS <- summary(w)
wS # same display

# variable names within all data sets
wS$name 




