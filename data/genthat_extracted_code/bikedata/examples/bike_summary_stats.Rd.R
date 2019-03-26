library(bikedata)


### Name: bike_summary_stats
### Title: Extract summary statistics of database
### Aliases: bike_summary_stats

### ** Examples

## Not run: 
##D data_dir <- tempdir ()
##D bike_write_test_data (data_dir = data_dir)
##D # dl_bikedata (city = 'la', data_dir = data_dir) # or download some real data!
##D # Remove one London file that triggers an API call which may fail tests:
##D file.remove (file.path (tempdir(), "01aJourneyDataExtract10Jan16-23Jan16.csv"))
##D bikedb <- file.path (data_dir, 'testdb')
##D store_bikedata (data_dir = data_dir, bikedb = bikedb)
##D # create database indexes for quicker access:
##D index_bikedata_db (bikedb = bikedb)
##D 
##D bike_summary_stats ('testdb')
##D 
##D bike_rm_test_data (data_dir = data_dir)
##D bike_rm_db (bikedb)
##D # don't forget to remove real data!
##D # file.remove (list.files ('.', pattern = '.zip'))
## End(Not run)



