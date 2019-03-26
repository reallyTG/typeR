library(oce)


### Name: read.g1sst
### Title: Read a G1SST file
### Aliases: read.g1sst

### ** Examples

## Not run: 
##D # Construct query, making it easier to understand and modify.
##D day <- "2016-01-02"
##D lon0 <- -66.5
##D lon1 <- -64.0
##D lat0 <- 44
##D lat1 <- 46
##D source <- paste("http://coastwatch.pfeg.noaa.gov/erddap/griddap/",
##D                 "jplG1SST.nc?",
##D                 "SST%5B(", day, "T12:00:00Z)",
##D                 "%5D%5B(", lat0, "):(", lat1, ")",
##D                 "%5D%5B(", lon0, "):(", lon1, ")",
##D                 "%5D", sep="")
##D if (!length(list.files(pattern="^a.nc$")))
##D     download.file(source, "a.nc")
##D d <- read.g1sst("a.nc")
##D plot(d, "SST", col=oceColorsJet)
##D data(coastlineWorldFine, package="ocedata")
##D lines(coastlineWorldFine[['longitude']],coastlineWorldFine[['latitude']])
## End(Not run)




