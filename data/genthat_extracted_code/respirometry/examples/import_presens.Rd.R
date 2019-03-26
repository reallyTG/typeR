library(respirometry)


### Name: import_presens
### Title: Import data from a PreSens O2 transmitter
### Aliases: import_presens

### ** Examples

## Not run: 
##D 
##D # Import a Fibox 3 file.
##D file <- system.file('extdata', 'fibox_3_file.txt', package = 'respirometry')
##D import_presens(file, o2_unit = 'umol_per_l', sal = 25)
##D 
##D # Import a Fibox 4 file.
##D file <- system.file('extdata', 'fibox_4_file.csv', package = 'respirometry')
##D import_presens(file = file, date = '%d-%b-%Y')
##D 
##D # Import an SDR SensorDish Reader file.
##D file <- system.file('extdata', 'sdr_file.txt', package = 'respirometry')
##D import_presens(file = file, date = '%d.%m.%y%X')
##D 
## End(Not run)



