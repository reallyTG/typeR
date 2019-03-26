library(clifro)


### Name: cfStation-class
### Title: The Clifro Station Object
### Aliases: cfStation-class cf_station cfStation

### ** Examples

## Not run: 
##D # Create a cfStation object for the Leigh 1 and 2 Ews stations
##D leigh.st = cf_station(1339, 1340)
##D leigh.st
##D 
##D # Note, this can also be achieved using the '+' operator
##D leigh.st = cf_station(1339) + cf_station(1340)
##D leigh.st
##D 
##D # Add another column showing how long the stations have been open for
##D leigh.df = as(leigh.st, "data.frame")
##D leigh.df$ndays = with(leigh.df, round(end - start))
##D leigh.df
##D 
##D # Save the stations to the current working directory as a KML to visualise
##D # the station locations
##D cf_save_kml(leigh.st)
## End(Not run)



