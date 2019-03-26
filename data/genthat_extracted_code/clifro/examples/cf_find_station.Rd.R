library(clifro)


### Name: cf_find_station
### Title: Search for Clifro Stations
### Aliases: cf_find_station

### ** Examples

## Not run: 
##D # Station Name Search ------------------------------------------------------
##D # Return all open stations with 'island' in the name (pattern match search)
##D # Note this example uses all the defaults
##D 
##D island_st = cf_find_station("island")
##D island_st
##D 
##D # Region Search ------------------------------------------------------------
##D # Return all the closed stations from Queenstown (using partial matching)
##D 
##D queenstown.st = cf_find_station("queen", search = "region", status = "closed")
##D queenstown.st
##D 
##D # Long/Lat Search ----------------------------------------------------------
##D # Return all open stations within a 10km radius of the Beehive in Wellington
##D # From Wikipedia: latitude 41.2784 S, longitude 174.7767 E
##D 
##D beehive.st = cf_find_station(lat = -41.2784, long = 174.7767, rad = 10,
##D                              search = "latlong")
##D beehive.st
##D 
##D # Network ID Search --------------------------------------------------------
##D # Return all stations that share A42 in their network ID
##D 
##D A42.st = cf_find_station("A42", search = "network", status = "all")
##D A42.st
##D 
##D # Using Datatypes in the Search --------------------------------------------
##D # Is the Reefton EWS station open and does it collect daily rain and/or wind
##D # data?
##D 
##D # First, create the daily rain and wind datatypes
##D daily.dt = cf_datatype(c(2, 3), c(1, 1), list(4, 1), c(1, NA))
##D daily.dt
##D 
##D # Then combine into the search. This will only return stations where at least
##D # one datatype is available.
##D cf_find_station("reefton EWS", datatype = daily.dt)  # Yes
##D 
##D # OR Query Search ----------------------------------------------------------
##D # Return all stations sharing A42 in their network ID *or* all the open
##D # stations within 10km of the Beehive in Wellington (note this is not
##D # currently available as a single query in CliFlo).
##D 
##D cf_find_station("A42", search = "network", status = "all") +
##D cf_find_station(lat = -41.2784, long = 174.7767, rad = 10,
##D                 search = "latlong")
##D 
##D # Note these are all ordered by open stations, then again by their end dates
## End(Not run)



