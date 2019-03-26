library(solaR)


### Name: D_compare-methods
### Title: Compare G0, Gef and ProdGCPV objects
### Aliases: compare compare-methods compare,G0-method compare,Gef-method
###   compare,ProdGCPV-method
### Keywords: methods

### ** Examples

lat=37.2;
G0dm=c(2766, 3491, 4494, 5912, 6989, 7742, 7919, 7027, 5369, 3562, 2814,
2179)
Ta=c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2, 15.2)
prom=list(G0dm=G0dm, Ta=Ta)

###Comparison of different tracker methods
ProdFixed<-prodGCPV(lat=lat, dataRad=prom, keep.night=FALSE)
Prod2x<-prodGCPV(lat=lat, dataRad=prom, modeTrk='two', keep.night=FALSE)
ProdHoriz<-prodGCPV(lat=lat, dataRad=prom, modeTrk='horiz', keep.night=FALSE)

compare(ProdFixed, Prod2x, ProdHoriz)

##The first element rules the method
GefFixed=as(ProdFixed, 'Gef')
compare(GefFixed, Prod2x, ProdHoriz)




