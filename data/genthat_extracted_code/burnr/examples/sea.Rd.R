library(burnr)


### Name: sea
### Title: Perform superposed epoch analysis.
### Aliases: sea

### ** Examples

## Not run: 
##D # Read in the Cook and Krusic (2004; The North American Drought Atlas) reconstruction
##D # of Palmer Drought Severity Index (PDSI) for the Jemez Mountains area (gridpoint 133).
## End(Not run)
## Not run: 
##D # For users who want to perform SEA very near to EVENT.exe and/or have reproducable draws from
##D # the bootstrap procedure, consider including the \code{set.seed} function prior to \code{run_sea}.
##D # Convention is to provide a long integer, such as a birthday (e.g. 3191982).
##D # In the EVENT.exe program, Richard Holmes used the number of days since 1 January 1935.
##D days <- as.numeric(Sys.Date() - as.Date("1jan1935", "%d%b%Y"))
##D set.seed(days)
## End(Not run)




