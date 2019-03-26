library(rerddap)


### Name: griddap
### Title: Get ERDDAP gridded data
### Aliases: griddap

### ** Examples

## Not run: 
##D # single variable dataset
##D ## You can pass in the outpu of a call to info
##D (out <- info('erdVHNchlamday'))
##D ## Or, pass in a dataset id
##D (res <- griddap('erdVHNchlamday',
##D  time = c('2015-04-01','2015-04-10'),
##D  latitude = c(18, 21),
##D  longitude = c(-120, -119)
##D ))
##D 
##D # multi-variable dataset
##D (out <- info('erdQMekm14day'))
##D (res <- griddap(out,
##D  time = c('2015-12-28','2016-01-01'),
##D  latitude = c(24, 23),
##D  longitude = c(88, 90)
##D ))
##D (res <- griddap(out, time = c('2015-12-28','2016-01-01'),
##D    latitude = c(24, 23), longitude = c(88, 90), fields = 'mod_current'))
##D (res <- griddap(out, time = c('2015-12-28','2016-01-01'),
##D    latitude = c(24, 23), longitude = c(88, 90), fields = 'mod_current',
##D    stride = c(1,2,1,2)))
##D (res <- griddap(out, time = c('2015-12-28','2016-01-01'),
##D    latitude = c(24, 23), longitude = c(88, 90),
##D    fields = c('mod_current','u_current')))
##D 
##D 
##D # Write to memory (within R), or to disk
##D (out <- info('erdQSwindmday'))
##D ## disk, by default (to prevent bogging down system w/ large datasets)
##D ## you can also pass in path and overwrite options to disk()
##D (res <- griddap(out,
##D  time = c('2006-07-11','2006-07-20'),
##D  longitude = c(166, 170),
##D  store = disk()
##D ))
##D ## the 2nd call is much faster as it's mostly just the time of reading in
##D ## the table from disk
##D system.time( griddap(out,
##D  time = c('2006-07-11','2006-07-15'),
##D  longitude = c(10, 15),
##D  store = disk()
##D ) )
##D system.time( griddap(out,
##D  time = c('2006-07-11','2006-07-15'),
##D  longitude = c(10, 15),
##D  store = disk()
##D ) )
##D 
##D ## memory - you have to choose fmt="csv" if you use memory
##D (res <- griddap("erdMBchla1day",
##D  time = c('2015-01-01','2015-01-03'),
##D  latitude = c(14, 15),
##D  longitude = c(125, 126),
##D  fmt = "csv", store = memory()
##D ))
##D 
##D ## Use ncdf4 package to parse data
##D info("erdMBchla1day")
##D (res <- griddap("erdMBchla1day",
##D  time = c('2015-01-01','2015-01-03'),
##D  latitude = c(14, 15),
##D  longitude = c(125, 126)
##D ))
##D 
##D # Get data in csv format
##D ## by default, we get netcdf format data
##D (res <- griddap('erdMBchla1day',
##D  time = c('2015-01-01','2015-01-03'),
##D  latitude = c(14, 15),
##D  longitude = c(125, 126),
##D  fmt = "csv"
##D ))
##D 
##D # Use a different ERDDAP server url
##D ## NOAA IOOS PacIOOS
##D url = "http://oos.soest.hawaii.edu/erddap/"
##D out <- info("NOAA_DHW_5km", url = url)
##D (res <- griddap(out,
##D  time = c('2015-11-01','2015-11-03'),
##D  latitude = c(21, 20),
##D  longitude = c(10, 11)
##D ))
##D ## pass directly into griddap()
##D griddap("NOAA_DHW_5km", url = url,
##D  time = c('2015-11-01','2015-11-03'),
##D  latitude = c(21, 20),
##D  longitude = c(10, 11)
##D )
##D 
##D # Using 'last'
##D ## with time
##D griddap('erdVHNchlamday',
##D  time = c('last-5','last'),
##D  latitude = c(18, 21),
##D  longitude = c(-120, -119)
##D )
##D ## with latitude
##D griddap('erdVHNchlamday',
##D   time = c('2015-04-01','2015-04-10'),
##D   latitude = c('last', 'last'),
##D   longitude = c(-120, -119)
##D )
##D ## with longitude
##D griddap('erdVHNchlamday',
##D   time = c('2015-04-01','2015-04-10'),
##D   latitude = c(18, 21),
##D   longitude = c('last', 'last')
##D )
##D 
##D # datasets without lat/lon grid and with fmt=nc
##D (x <- info('glos_tds_5912_ca66_3f41'))
##D res <- griddap(x,
##D   time = c('2018-04-01','2018-04-10'),
##D   ny = c(1, 2),
##D   nx = c(3, 5)
##D )
##D ## data.frame is empty
##D res$data
##D ## read in from the nc file path
##D ncdf4::nc_open(res$summary$filename)
## End(Not run)



