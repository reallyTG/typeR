library(SDMTools)


### Name: read.asc
### Title: ESRI ASCII Raster File Import And Export
### Aliases: image.asc print.asc read.asc read.asc.gz write.asc
###   write.asc.gz write.asc2 write.asc2.gz

### ** Examples

#create a simple object of class 'asc'
tasc = as.asc(matrix(rep(x=1:10, times=1000),nr=100)); print(tasc)

#write out the raster grid file
write.asc(tasc,'t.raster.asc')
write.asc.gz(tasc,'t.raster.asc') #actually save file name as t.raster.asc.gz

#read in the raster grid files
tasc2 = read.asc('t.raster.asc')
tasc3 = read.asc.gz('t.raster.asc.gz')

#remove the temporary raster
unlink(c('t.raster.asc','t.raster.asc.gz'))



