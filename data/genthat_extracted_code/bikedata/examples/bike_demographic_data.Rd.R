library(bikedata)


### Name: bike_demographic_data
### Title: Static summary of which systems provide demographic data
### Aliases: bike_demographic_data

### ** Examples

bike_demographic_data ()
# Examples of filtering data by demographic parameters:
## Not run: 
##D data_dir <- tempdir ()
##D bike_write_test_data (data_dir = data_dir)
##D bikedb <- file.path (data_dir, 'testdb')
##D store_bikedata (data_dir = data_dir, bikedb = bikedb)
##D # create database indexes for quicker access:
##D index_bikedata_db (bikedb = bikedb)
##D 
##D sum (bike_tripmat (bikedb = bikedb, city = 'bo')) # 200 trips
##D sum (bike_tripmat (bikedb = bikedb, city = 'bo', birth_year = 1990)) # 9
##D sum (bike_tripmat (bikedb = bikedb, city = 'bo', gender = 'f')) # 22
##D sum (bike_tripmat (bikedb = bikedb, city = 'bo', gender = 2)) # 22
##D sum (bike_tripmat (bikedb = bikedb, city = 'bo', gender = 1)) # = m; 68
##D sum (bike_tripmat (bikedb = bikedb, city = 'bo', gender = 0)) # = n; 9
##D # Sum of gender-filtered trips is less than total because \code{gender = 0}
##D # extracts all registered users with unspecified genders, while without gender
##D # filtering extracts all trips for registered and non-registered users.
##D 
##D # The following generates an error because Washinton DC's DivvyBike system does
##D # not provide demographic data
##D sum (bike_tripmat (bikedb = bikedb, city = 'dc', birth_year = 1990))
##D bike_rm_test_data (data_dir = data_dir)
##D bike_rm_db (bikedb)
## End(Not run)



