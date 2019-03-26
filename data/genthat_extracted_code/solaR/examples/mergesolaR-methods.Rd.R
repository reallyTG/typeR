library(solaR)


### Name: D_mergesolaR-methods
### Title: Merge solaR objects
### Aliases: mergesolaR mergesolaR-methods mergesolaR,G0-method
###   mergesolaR,Gef-method mergesolaR,Meteo-method
###   mergesolaR,ProdGCPV-method mergesolaR,ProdPVPS-method
### Keywords: methods

### ** Examples

lat=37.2;
G0dm=c(2766, 3491, 4494, 5912, 6989, 7742, 7919, 7027, 5369, 3562, 2814,
2179)
Ta=c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2, 15.2)
prom=list(G0dm=G0dm, Ta=Ta)

###Different tracker methods
ProdFixed<-prodGCPV(lat=lat,dataRad=prom, keep.night=FALSE)
Prod2x<-prodGCPV(lat=lat, dataRad=prom, modeTrk='two', keep.night=FALSE)
ProdHoriz<-prodGCPV(lat=lat,dataRad=prom, modeTrk='horiz', keep.night=FALSE)

prod <- mergesolaR(ProdFixed, Prod2x, ProdHoriz)
head(prod)



