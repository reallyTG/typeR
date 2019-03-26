library(antaresRead)


### Name: readAntares
### Title: Read the data of an Antares simulation
### Aliases: readAntares

### ** Examples

## Not run: 
##D # Import areas and links separately
##D 
##D areas <- readAntares() # equivalent to readAntares(areas="all")
##D links <- readAntares(links="all")
##D 
##D # Import areas and links at same time
##D 
##D output <- readAntares(areas = "all", links = "all")
##D 
##D # Add input time series to the object returned by the function
##D areas <- readAntares(areas = "all", misc = TRUE, reserve = TRUE)
##D 
##D # Get all output for one area
##D 
##D myArea <- sample(simOptions()$areaList, 1)
##D myArea
##D 
##D myAreaOutput <- readAntares(area = myArea,
##D                             links = getLinks(myArea, regexpSelect=FALSE),
##D                             clusters = myArea)
##D 
##D # Or equivalently:
##D myAreaOutput <- readAntaresAreas(myArea)
##D 
##D # Use parameter "select" to read only some columns.
##D 
##D areas <- readAntares(select = c("LOAD", "OV. COST"))
##D 
##D # Aliases can be used to select frequent groups of columns. use showAliases()
##D # to view a list of available aliases
##D 
##D areas <- readAntares(select="economy")
##D 
## End(Not run)



