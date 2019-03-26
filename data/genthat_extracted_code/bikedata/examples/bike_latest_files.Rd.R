library(bikedata)


### Name: bike_latest_files
### Title: Check whether files in database are the latest published files
### Aliases: bike_latest_files

### ** Examples

data_dir <- tempdir ()
bike_write_test_data (data_dir = data_dir)
# or download some real data!
# dl_bikedata (city = 'la', data_dir = data_dir)
# Remove one London file that triggers an API call which may fail tests:
file.remove (file.path (tempdir(), "01aJourneyDataExtract10Jan16-23Jan16.csv"))
bikedb <- file.path (data_dir, 'testdb')
store_bikedata (data_dir = data_dir, bikedb = bikedb)
# bike_latest_files (bikedb)
# All false because test data are not current, but would pass with real data

bike_rm_test_data (data_dir = data_dir)
bike_rm_db (bikedb)
# don't forget to remove real data!
# file.remove (list.files (data_dir, pattern = '.zip'))



