library(daymetr)


### Name: read_daymet
### Title: Read Single Pixel Daymet data
### Aliases: read_daymet
### Keywords: Daymet series, time

### ** Examples


## Not run: 
##D # with defaults, outputting a data frame
##D # with smoothed values, overwriting the original
##D 
##D # download the data
##D download_daymet(site = "Daymet",
##D                  start = 1980,
##D                  end = 1980,
##D                  internal = FALSE,
##D                  silent = TRUE)
##D 
##D # read in the Daymet file
##D df = read_daymet(paste0(tempdir(),"/Daymet_1980_1980.csv"))
##D 
##D # print data structure
##D print(str(df))
## End(Not run)



