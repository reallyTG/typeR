library(oceanmap)


### Name: readbin
### Title: Returns ".gz"-file as matrix or raster-object
### Aliases: readbin
### Keywords: parameter_definitions

### ** Examples

### Example: read and plot '.gz'-file
path <- system.file("test_files", package="oceanmap")
check_gzfiles(folder=path) # return file summary-table
gz.files <- Sys.glob(paste0(path,'/*.gz')) # load sample-'.gz'-files

### all manual:
obj <- readbin(gz.files[2],area='lion')
obj
ticks <- seq(20,30,5)
data('cmap')
image(obj,zlim=range(ticks),col=cmap$jet)
plotmap('lion',add=TRUE) # add landmask
#set.colorbar(ticks=ticks,cb.title='cb.title',cb.xlab='cb.xlab')

### using v:

## ticks set by adaptive.vals
v(obj,varname="sst2",cb.title='cb.title',cb.xlab='cb.xlab') 

## ticks set by parameter definition
v(obj,varname="sst2",cb.title='cb.title',cb.xlab='cb.xlab',adaptive.vals=FALSE) 

### extracting subregion:
obj <- readbin(gz.files[2])
area.extent <- extent(c(5,10,35,40))
subarea <- crop(obj,area.extent)
# v(subarea)

## getting average value:
mean(subarea[,],na.rm=TRUE)



