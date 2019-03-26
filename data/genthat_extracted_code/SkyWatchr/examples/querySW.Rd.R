library(SkyWatchr)


### Name: querySW
### Title: Query the SkyWatch API for satellite imagery and
###   climate/atmospheric datasets
### Aliases: querySW
### Keywords: spatial

### ** Examples

## Not run: 
##D api_key <- "your_personal_alphanumeric_api_key"
##D 
##D # Set the SkyWatchr.apikey option 
##D options(SkyWatchr.apikey = api_key)
##D 
##D # Query data for one of the world largest landfills "Olusosun Dump" in Nigeria
##D querySW(time_period = "2015-8", longitude_latitude = "3.367358,6.566358,3.387358,6.586358")
##D 
##D # If the SkyWatchr.apikey option is not set, then provide the API key
##D querySW(api_key, time_period = "2015-8", longitude_latitude = "3.367358,6.566358,3.387358,6.586358")
##D 
##D # An Imperial Oil refinery in Canada
##D res <- querySW(time_period = 2015, longitude_latitude = "-82.4169987,42.954811", data_level = 3)
##D View(res)
##D 
##D # The smoggiest city on Earth Ahvaz, Iran
##D querySW(time_period = "2015-06", longitude_latitude = "48.676074,31.321119", data_level = 3)
##D 
##D # Ahvaz, Iran in September, 2015
##D querySW(time_period = "2015-9", longitude_latitude = "48.676074,31.321119", data_level = 1, 
##D         wavelength_band = "red,green,blue")
##D 
##D # Other examples
##D querySW(time_period = "2009-12-25", longitude_latitude = "-71.1043443253471,-42.3150676015829", 
##D         data_level = 2)
##D querySW(time_period = "2009-12-25", longitude_latitude = "-71.1043443253471,-42.3150676015829")
##D 
##D querySW(time_period = "2016-07-11,2016-07-12", 
##D         longitude_latitude = "-71.1,-42.3,71.1,-42.3,71.1,42.3,-71.1,42.3,-71.1,-42.3",
##D         instrument_satellite = "Landsat-8", data_level = 1, max_resolution = 30, 
##D         max_cloudcover = 100, wavelength_band = "Blue")
##D 
##D # Print output data.frame as html
##D querySW(time_period = "2015-8", longitude_latitude = "3.367358,6.566358,3.387358,6.586358", 
##D         output = "html")
##D querySW(time_period = "2016-07-11,2016-07-12", 
##D         longitude_latitude = "-71.1,-42.3,71.1,-42.3,71.1,42.3,-71.1,42.3,-71.1,-42.3",
##D         instrument_satellite = "Landsat-8", data_level = 1, max_resolution = 30, 
##D         max_cloudcover = 100, wavelength_band = "Blue", output = "html")
##D 
##D # Queries can also be performed using objects of class Spatial (as defined by the sp package) 
##D # projected in geographic coordinates
##D ex1 <- data.frame(x = -71.1043443253, y = -42.3150676016, data = "point")
##D coordinates(ex1) <- ~ x + y
##D class(ex1)
##D querySW(time_period = "2015-8", longitude_latitude = ex1)
## End(Not run)



