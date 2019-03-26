library(oceanmap)


### Name: writebin
### Title: Saves geographic data as byte file (".gz")
### Aliases: writebin
### Keywords: parameter_definitions

### ** Examples

## Example for selecting wrong area definition when saving files
path <- system.file("test_files", package="oceanmap")
gz.files <- Sys.glob(paste0(path,'/*.gz')) # load sample-'.gz'-files
v(gz.files[1])

fname <- name_split(gz.files[1])
param <- fname$parameter
gz <- readbin(gz.files[1])
dim(gz)
v(gz.files[1])

### reset region name
fname$area <- 'med9'
fname <- name_join(fname)
# writebin(gz,fname,folder=path,param=param)
# v(fname)
# system(paste('rm', fname))

### multi layer raster file
gz2 <- stack(gz,gz)
# writebin(gz2,rep(gz.files[1],2),folder=path,param) # error message since multi layer
# writebin(gz,gz.files[1],folder=path,param) # single layer raster file
# v(gz.files[1])



