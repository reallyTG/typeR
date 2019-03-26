library(seasonal)


### Name: import.ts
### Title: Import Time Series from X-13 Data Files
### Aliases: import.ts

### ** Examples

## Not run: 
##D tdir <- tempdir()
##D seas(x = AirPassengers, dir = tdir) 
##D import.ts(file.path(tdir, "data.dta"))
##D import.ts(file.path(tdir, "iofile.rsd"), format = "x13save")
## End(Not run)



