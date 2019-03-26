library(oceanmap)


### Name: area_extrac
### Title: Extracts a pre-defined region from ".gz"-file and saves subset
###   as a new ".gz"-file
### Aliases: area_extrac
### Keywords: region_definitions

### ** Examples

## Example 1: extract, write '.gz'-files, following default plot-procedure
library(raster)

# load sample-'.gz'-file
path <- system.file("test_files", package="oceanmap")
gz.files <- Sys.glob(paste0(path,'/*.gz'))[1] # load sample-'.gz'-files
print(gz.files)
# area_extrac(gz.files[1],area='lion')

# gz <- Sys.glob(path,'/medw4*.gz') # load new-'.gz'-file
# v(gz) # visualize new-'.gz'-file
# system(paste('rm', gz))       
# v(gz.files[1],v_area='lion')



