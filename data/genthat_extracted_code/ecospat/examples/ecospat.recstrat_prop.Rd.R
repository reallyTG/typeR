library(ecospat)


### Name: ecospat.recstrat_prop
### Title: Random Ecologically Stratified Sampling of propotional numbers
### Aliases: ecospat.recstrat_prop

### ** Examples

  ## Not run: 
##D     bio3<- raster(system.file("external/bioclim/current/bio3.grd",package="biomod2"))
##D     bio12<- raster(system.file("external/bioclim/current/bio12.grd",package="biomod2"))
##D     B3.rcl<-ecospat.rcls.grd(bio3,9) 
##D     B12.rcl<-ecospat.rcls.grd(bio12,9)
##D     B3B12.comb <- B12.rcl+B3.rcl*10
##D     B3B12.prop_samples <- ecospat.recstrat_prop(B3B12.comb,100)
##D     plot(B3B12.comb)
##D     points(B3B12.prop_samples$x,B3B12.prop_samples$y,pch=16,cex=0.6,col=B3B12.prop_samples$class)
##D     
##D     
##D   
## End(Not run)
  



