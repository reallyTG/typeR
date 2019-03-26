library(bikedata)


### Name: bike_daily_trips
### Title: Extract daily trip counts for all stations
### Aliases: bike_daily_trips

### ** Examples

## Not run: 
##D bike_write_test_data () # by default in tempdir ()
##D # dl_bikedata (city = 'la', data_dir = data_dir) # or download some real data!
##D store_bikedata (data_dir = tempdir (), bikedb = 'testdb')
##D # create database indexes for quicker access:
##D index_bikedata_db (bikedb = 'testdb')
##D 
##D bike_daily_trips (bikedb = 'testdb', city = 'ny')
##D bike_daily_trips (bikedb = 'testdb', city = 'ny', member = TRUE)
##D bike_daily_trips (bikedb = 'testdb', city = 'ny', gender = 'f')
##D bike_daily_trips (bikedb = 'testdb', city = 'ny', station = '173',
##D                   gender = 1)
##D 
##D bike_rm_test_data ()
##D bike_rm_db ('testdb')
##D # don't forget to remove real data!
##D # file.remove (list.files ('.', pattern = '.zip'))
## End(Not run)



