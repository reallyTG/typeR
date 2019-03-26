library(s2dverification)


### Name: .LoadDataFile
### Title: Load Data From File Into Environment
### Aliases: .LoadDataFile
### Keywords: datagen internal

### ** Examples

  ## Not run: 
##D data <- s2dverification:::.LoadDataFile(list(dataset_type = 'exp', 
##D         filename = system.file('sample_data/model/experiment/monthly_mean', 
##D                                'tos_3hourly/tos_19901101.nc', 
##D                                package = 's2dverification'),
##D         namevar = 'tos', lon_limits = c(-12, 40), 
##D         lat_limits = c(27, 48), is_file_per_member = TRUE, 
##D         dimnames = list(lon = 'longitude', lat = 'latitude', 
##D         member = 'ensemble')), explore_dims = TRUE, silent = FALSE)
##D   
## End(Not run)



