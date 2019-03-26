library(clifro)


### Name: cf_save_kml
### Title: Save Clifro Station Information to a KML File
### Aliases: cf_save_kml

### ** Examples

## Not run: 
##D # A selection of four Auckland region stations down the East Coast to the
##D # upper Waitemata Harbour; Leigh 2 Ews, Warkworth Ews, Tiri Tiri Lighthouse
##D # and Henderson
##D my.stations = cf_station(17838, 1340, 1401, 12327)
##D my.stations
##D 
##D # Save these stations to a KML file
##D cf_save_kml(my.stations)
##D 
##D # Double click on the file to open with a default program (if available). All
##D # the markers are green, indicating all these stations are open.
##D 
##D # Where is the subscription-free Reefton Ews station?
##D cf_save_kml(cf_station(), file_name = "reeftonEWS")
##D 
##D # It's located in the sou'west quadrant of Reefton town, in the upper, western
##D # part of the South Island, NZ.
##D 
##D # Find all the open and closed Christchurch stations (using partial matching)
##D all.chch.st = cf_find_station("christ", status = "all", search = "region")
##D 
##D # How many stations in total?
##D nrow(all.chch.st)
##D 
##D # Save all the Christchurch stations
##D cf_save_kml(all.chch.st, file_name = "all_Chch_stations")
## End(Not run)



