library(daymetr)


### Name: download_daymet_ncss
### Title: Function to geographically subset 'Daymet' regions exceeding
###   tile limits
### Aliases: download_daymet_ncss
### Keywords: climate data daymet,

### ** Examples


## Not run: 
##D # The following call allows you to subset gridded
##D # Daymet data using a bounding box location. This
##D # is an alternative way to query gridded data. The
##D # routine is particularly helpful if you need certain
##D # data which stradles boundaries of multiple tiles
##D # or a smaller subset of a larger tile. Keep in mind
##D # that there is a 6GB upper limit to the output file
##D # so querying larger regions will result in an error.
##D # To download larger areas use the download_daymet_tiles()
##D # function.
##D 
##D # Download a subset of a / multiple tiles
##D # into your current working directory.
##D download_daymet_ncss(location = c(34, -82, 33.75, -81.75),
##D                       start = 1980,
##D                       end = 1980,
##D                       param = "tmin",
##D                       path = tempdir())
##D                       
##D # For other practical examples consult the included
##D # vignette. 
## End(Not run)



