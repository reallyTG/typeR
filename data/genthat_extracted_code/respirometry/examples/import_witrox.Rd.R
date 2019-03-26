library(respirometry)


### Name: import_witrox
### Title: Import data from a Loligo Systems Witrox O2 transmitter
### Aliases: import_witrox

### ** Examples

## Not run: 
##D file <- system.file('extdata', 'witrox_file.txt', package = 'respirometry')
##D import_witrox(file, o2_unit = 'umol_per_l')
##D 
##D # Oops. I forgot to change the salinity value when I calibrated
##D # the instrument. Override the values in the file for 35 psu.
##D import_witrox(file, o2_unit = 'umol_per_kg', overwrite_sal = 35)
##D 
##D # I want each channel as a separate data frame.
##D data_list <- import_witrox(file, split_channels = TRUE)
##D data_list$CH_3 # here's the channel 3 data frame.
## End(Not run)




