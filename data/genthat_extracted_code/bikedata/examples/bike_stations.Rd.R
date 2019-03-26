library(bikedata)


### Name: bike_stations
### Title: Extract station matrix from SQLite3 database
### Aliases: bike_stations

### ** Examples

## Not run: 
##D data_dir <- tempdir ()
##D bike_write_test_data (data_dir = data_dir)
##D # or download some real data!
##D # dl_bikedata (city = 'la', data_dir = data_dir)
##D bikedb <- file.path (data_dir, 'testdb')
##D store_bikedata (data_dir = data_dir, bikedb = bikedb)
##D # create database indexes for quicker access:
##D index_bikedata_db (bikedb = bikedb)
##D 
##D stations <- bike_stations (bikedb)
##D head (stations)
##D 
##D bike_rm_test_data (data_dir = data_dir)
##D bike_rm_db (bikedb)
##D # don't forget to remove real data!
##D # file.remove (list.files (data_dir, pattern = '.zip'))
## End(Not run)



