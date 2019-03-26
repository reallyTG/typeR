library(ecospat)


### Name: ecospat.rcls.grd
### Title: Reclassifying grids function
### Aliases: ecospat.rcls.grd

### ** Examples


   ## Not run: 
##D bio3<- raster(system.file("external/bioclim/current/bio3.grd",package="biomod2"))
##D bio12<- raster(system.file("external/bioclim/current/bio12.grd",package="biomod2"))
##D B3.rcl<-ecospat.rcls.grd(bio3,9) 
##D B12.rcl<-ecospat.rcls.grd(bio12,9)
##D B3B12.comb <- B12.rcl+B3.rcl*10
##D 
##D # Plotting a histogram of the classes
##D hist(B3B12.comb,breaks=100,col=heat.colors(88)) 
##D # Plotting the new RasterLayer (9x9 classes)
##D plot(B3B12.comb,col=rev(rainbow(88)),main="Stratified map") 
##D 
## End(Not run)


