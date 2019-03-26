library(bikedata)


### Name: bike_tripmat
### Title: Extract station-to-station trip matrix or data.frame from
###   SQLite3 database
### Aliases: bike_tripmat

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
##D 
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny') # full trip matrix
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny',
##D                     start_date = 20161201, end_date = 20161201)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', start_time = 1)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', start_time = "01:00")
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', end_time = "01:00")
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', 
##D                     start_date = 20161201, start_time = 1)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', start_date = 20161201,
##D                     end_date = 20161201, start_time = 1, end_time = 2)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', weekday = 5)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', weekday = c('f', 'sa', 'th'))
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', weekday = c('f', 'th', 'sa'))
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', member = 1)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', birth_year = 1976)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', birth_year = 1976:1990)
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny', gender = 'f')
##D tm <- bike_tripmat (bikedb = bikedb, city = 'ny',
##D                     gender = 'm', birth_year = 1976:1990)
##D 
##D bike_rm_test_data (data_dir = data_dir)
##D bike_rm_db (bikedb)
##D # don't forget to remove real data!
##D # file.remove (list.files (data_dir, pattern = '.zip'))
## End(Not run)



