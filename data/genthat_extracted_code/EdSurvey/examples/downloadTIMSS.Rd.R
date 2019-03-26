library(EdSurvey)


### Name: downloadTIMSS
### Title: Download and Unzip TIMSS Files
### Aliases: downloadTIMSS

### ** Examples

## Not run: 
##D # root argument will vary by operating system conventions
##D downloadTIMSS(year=c(2015, 2011), root = "C:/")
##D 
##D # cache=TRUE will download then process the datafiles
##D downloadTIMSS(year=2015, root = "C:/", cache = TRUE)
##D 
##D #set verbose=FALSE for silent output
##D #if year not specified, download all years
##D downloadTIMSS(root="C:/", verbose = FALSE)
## End(Not run)



