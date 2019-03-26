library(respirometry)


### Name: import_firesting
### Title: Import data from a FireSting O2 transmitter
### Aliases: import_firesting

### ** Examples

## Not run: 
##D file <- system.file('extdata', 'firesting_file.txt', package = 'respirometry')
##D import_firesting(file, o2_unit = 'umol_per_l')
##D 
##D # I want each channel as a separate data frame.
##D data_list <- import_firesting(file, split_channels = TRUE)
##D data_list$CH_3 # here's the channel 3 data frame.
## End(Not run)




