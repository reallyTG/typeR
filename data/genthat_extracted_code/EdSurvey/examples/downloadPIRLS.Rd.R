library(EdSurvey)


### Name: downloadPIRLS
### Title: Download and Unzip PIRLS Files
### Aliases: downloadPIRLS

### ** Examples

## Not run: 
##D # root argument will vary by operating system conventions
##D downloadPIRLS(year=c(2006, 2011), root = "C:/")
##D 
##D # cache=TRUE will download then process the datafiles
##D downloadPIRLS(year=2011, root = "C:/", cache = TRUE)
##D 
##D #set verbose=FALSE for silent output
##D #if year not specified, download all years
##D downloadPIRLS(root="C:/", verbose = FALSE)
## End(Not run)



