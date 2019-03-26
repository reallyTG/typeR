library(bikedata)


### Name: bike_db_totals
### Title: Count number of entries in sqlite3 database tables
### Aliases: bike_db_totals

### ** Examples

data_dir <- tempdir ()
bike_write_test_data (data_dir = data_dir)
bikedb <- file.path (data_dir, 'testdb')
store_bikedata (data_dir = data_dir, bikedb = bikedb)
# create database indexes for quicker access:
index_bikedata_db (bikedb = bikedb)

bike_db_totals (bikedb = bikedb, trips = TRUE) # total trips
bike_db_totals (bikedb = bikedb, trips = TRUE, city = 'ch')
bike_db_totals (bikedb = bikedb, trips = TRUE, city = 'ny')
bike_db_totals (bikedb = bikedb, trips = FALSE) # total stations
bike_db_totals (bikedb = bikedb, trips = FALSE, city = 'ch')
bike_db_totals (bikedb = bikedb, trips = FALSE, city = 'ny')
# numbers of stations can also be extracted with
nrow (bike_stations (bikedb = bikedb))
nrow (bike_stations (bikedb = bikedb, city = 'ch'))

bike_rm_test_data (data_dir = data_dir)
bike_rm_db (bikedb)
# don't forget to remove real data!
# file.remove (list.files ('.', pattern = '.zip'))



