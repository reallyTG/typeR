library(bikedata)


### Name: bike_stored_files
### Title: Get names of files read into database
### Aliases: bike_stored_files

### ** Examples

data_dir <- tempdir ()
bike_write_test_data (data_dir = data_dir)
bikedb <- file.path (data_dir, 'testdb')
store_bikedata (data_dir = data_dir, bikedb = bikedb)
files <- bike_stored_files (bikedb = bikedb)
# returns a tibble with names of all stored files

bike_rm_test_data (data_dir = data_dir)
bike_rm_db (bikedb)
# don't forget to remove real data!
# file.remove (list.files ('.', pattern = '.zip'))



