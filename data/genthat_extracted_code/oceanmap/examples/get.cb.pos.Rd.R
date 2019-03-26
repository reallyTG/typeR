library(oceanmap)


### Name: get.cb.pos
### Title: Returns additional colorbar placement information
### Aliases: get.cb.pos
### Keywords: internal

### ** Examples

path <- system.file("test_files", package="oceanmap")
gz.files <- Sys.glob(paste0(path,'/*.gz')) # load sample-'.gz'-files

obj <- readbin(gz.files[2],area='lion')
ncorse <- crop(obj,extent(6,9,40,42))
cbx <-c(8.3,8.9)
cby <- c(40.7,40.8)
v(ncorse,zlim=c(20,30),cbx=cbx,cby=cby) # skipping colorbar widget

get.cb.pos(cbx=cbx,cby=cby,oticks="b") 

#dev.new()
#image(obj)
#align <- set.colorbar()
#get.cb.pos(cbx=align$cbx,cby=align$cby,oticks=align$oticks)



