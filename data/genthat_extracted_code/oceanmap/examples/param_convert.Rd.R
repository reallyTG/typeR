library(oceanmap)


### Name: param_convert
### Title: converts byte data to absolte values or vise versa
###   ('param_unconvert')
### Aliases: param_convert param_unconvert
### Keywords: parameter_definitions

### ** Examples

library('fields')
path <- system.file("test_files", package="oceanmap")
gz.file <- Sys.glob(paste0(path,'/*.gz'))[1] # load sample-'.gz'-files
param <- name_split(gz.file)$parameter
print(param)

## converted data, according to param information
m <- readbin(gz.file, Raster=FALSE) 
image.plot(m)

## byte data ("unconverted") according to param information, as stored in ".gz"files
bin <- param_unconvert(m,param) 
image.plot(bin)

## reconverting byte data, according to param information
conv <- param_convert(bin,param) 
image.plot(conv)




