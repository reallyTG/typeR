library(REddyProcNCDF)


### Name: fLoadFluxNCIntoDataframe
### Title: Load data from a NetCDF file
### Aliases: fLoadFluxNCIntoDataframe

### ** Examples
## No test: 
examplePath <- system.file(
file.path('examples','Example_DE-Tha.1996.1998.hourly_selVars.nc')
, package = "REddyProcNCDF")
EddyNCData <- fLoadFluxNCIntoDataframe(c('NEE', 'Rg', 'NEE_f'), examplePath)
## End(No test)


