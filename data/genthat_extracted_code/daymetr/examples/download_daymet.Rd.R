library(daymetr)


### Name: download_daymet
### Title: Function to download single location 'Daymet' data
### Aliases: download_daymet
### Keywords: Daymet, climate data, pixel single

### ** Examples


## Not run: 
##D # The following commands download and process Daymet data
##D # for 10 years of the >30 year of data available since 1980.
##D daymet_data <- download_daymet("testsite_name",
##D                 lat = 36.0133,
##D                 lon = -84.2625,
##D                 start = 2000,
##D                 end = 2010,
##D                 internal = TRUE)
##D 
##D # We can now quickly calculate and plot
##D # daily mean temperature. Also, take note of
##D # the weird format of the header. This format 
##D # is not altered as to keep compatibility
##D # with other ways of acquiring Daymet data
##D # through the ORNL DAAC website.
##D 
##D # The below command lists headers of 
##D # the downloaded nested list.
##D # This data includes information on the site
##D # location etc. The true climate data is stored
##D # in the "data" part of the nested list.
##D # In this case it can be accessed through
##D # daymet_data$data. Other attributes include
##D # for example the tile location (daymet_data$tile),
##D # the altitude (daymet_data$altitude), etc.
##D str(daymet_data)
##D 
##D # load the tidyverse (install if necessary)
##D if(!require(tidyverse)){install.package(tidyverse)}
##D library(tidyverse)
##D 
##D # Calculate the mean temperature from min
##D # max temperatures and convert the year and doy
##D # to a proper date format.
##D daymet_data$data <- daymet_data$data %>%
##D  mutate(tmean = (tmax..deg.c. + tmin..deg.c.)/2,
##D         date = as.Date(paste(year, yday, sep = "-"), "%Y-%j"))
##D 
##D # show a simple graph of the mean temperature
##D plot(daymet_data$data$date,
##D      daymet_data$data$tmean,
##D      xlab = "Date",
##D      ylab = "mean temperature")
##D  
##D # For other practical examples consult the included
##D # vignette. 
## End(Not run)



