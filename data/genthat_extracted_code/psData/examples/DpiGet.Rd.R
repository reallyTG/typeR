library(psData)


### Name: DpiGet
### Title: Downloads the Database of Political Institutions (DPI)
### Aliases: DpiGet

### ** Examples

## Not run: 
##D # Download full data set
##D DpiData <- DpiGet()
##D 
##D # Create data frame with only the military variable
##D DpiSub <- DpiGet(vars = 'military',
##D                  OutCountryID = 'imf')
## End(Not run)




