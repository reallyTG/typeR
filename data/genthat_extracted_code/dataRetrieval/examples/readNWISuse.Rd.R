library(dataRetrieval)


### Name: readNWISuse
### Title: Water use data retrieval from USGS (NWIS)
### Aliases: readNWISuse

### ** Examples

## Not run: 
##D #All data for a county
##D allegheny <- readNWISuse(stateCd = "Pennsylvania",countyCd = "Allegheny")
##D 
##D #Data for an entire state for certain years
##D ohio <- readNWISuse(years=c(2000,2005,2010),stateCd = "OH", countyCd = NULL)
##D 
##D #Data for an entire state, county by county
##D pr <- readNWISuse(years=c(2000,2005,2010),stateCd = "PR",countyCd="ALL")
##D 
##D #All national-scale data, transforming data frame to named columns from named rows
##D national <- readNWISuse(stateCd = NULL, countyCd = NULL, transform = TRUE)
##D 
##D #Washington, DC data
##D dc <- readNWISuse(stateCd = "DC",countyCd = NULL)
##D 
##D #data for multiple counties, with different input formatting
##D paData <- readNWISuse(stateCd = "42",countyCd = c("Allegheny County", "BUTLER", 1, "031"))
##D 
##D #retrieving two specific categories for an entire state
##D ks <- readNWISuse(stateCd = "KS", countyCd = NULL, categories = c("IT","LI"))
## End(Not run)



