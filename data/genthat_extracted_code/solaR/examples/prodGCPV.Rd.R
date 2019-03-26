library(solaR)


### Name: A4_prodGCPV
### Title: Performance of a grid connected PV system.
### Aliases: prodGCPV
### Keywords: utilities constructors

### ** Examples

library(lattice)
library(latticeExtra)

lat=37.2;
G0dm=c(2766, 3491, 4494, 5912, 6989, 7742, 7919, 7027, 5369, 3562, 2814,
2179)
Ta=c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2, 15.2)
prom=list(G0dm=G0dm, Ta=Ta)

###Comparison of different tracker methods
prodFixed<-prodGCPV(lat=lat,dataRad=prom, keep.night=FALSE)
prod2x<-prodGCPV(lat=lat, dataRad=prom, modeTrk='two', keep.night=FALSE)
prodHoriz<-prodGCPV(lat=lat,dataRad=prom, modeTrk='horiz', keep.night=FALSE)

##Comparison of yearly productivities
compare(prodFixed, prod2x, prodHoriz)
compareLosses(prodFixed, prod2x, prodHoriz)

##Comparison of power time series
ComparePac<-CBIND(two=as.zooI(prod2x)$Pac,
     horiz=as.zooI(prodHoriz)$Pac,
     fixed=as.zooI(prodFixed)$Pac)
AngSol=as.zooI(as(prodFixed, 'Sol'))
ComparePac=CBIND(AngSol, ComparePac)
mon=month(index(ComparePac))

xyplot(two+horiz+fixed~AzS|mon, data=ComparePac,
     type='l', auto.key=list(space='right', lines=TRUE, points=FALSE),ylab='Pac')

###Use of modeRad='aguiar' and modeRad='prev'
prodAguiarFixed <- prodGCPV(lat=41,
                            modeRad='aguiar',
                            dataRad=G0dm,
                            keep.night=FALSE)

##We want to compare systems with different effective irradiance
##so we have to convert prodAguiarFixed to a 'G0' object.
G0Aguiar=as(prodAguiarFixed, 'G0')

prodAguiar2x<-prodGCPV(lat=41,modeTrk='two',modeRad='prev', dataRad=G0Aguiar)
prodAguiarHoriz<-prodGCPV(lat=41, modeTrk='horiz',modeRad='prev',
dataRad=G0Aguiar)

##Comparison of yearly values
compare(prodAguiarFixed, prodAguiar2x, prodAguiarHoriz)
compareLosses(prodAguiarFixed, prodAguiar2x, prodAguiarHoriz)

##Compare of daily productivities of each tracking system
compareYf <- mergesolaR(prodAguiarFixed, prodAguiar2x, prodAguiarHoriz)
xyplot(compareYf, superpose=TRUE,
ylab='kWh/kWp', main='Daily productivity', auto.key=list(space='right'))


###Shadows
#Two-axis trackers
struct2x=list(W=23.11, L=9.8, Nrow=2, Ncol=8)
dist2x=data.frame(Lew=40, Lns=30, H=0)
prod2xShd<-prodGCPV(lat=lat, dataRad=prom, modeTrk='two',
    modeShd='area', struct=struct2x, distances=dist2x)
print(prod2xShd)

#Horizontal N-S tracker
structHoriz=list(L=4.83);
distHoriz=data.frame(Lew=structHoriz$L*4);

#Without Backtracking
prodHorizShd<-prodGCPV(lat=lat, dataRad=prom, sample='10 min',
    modeTrk='horiz',
    modeShd='area', betaLim=60,
    distances=distHoriz,
    struct=structHoriz)
print(prodHorizShd)

xyplot(r2d(Beta)~r2d(w),
     data=prodHorizShd,
     type='l',
     main='Inclination angle of a horizontal axis tracker',
     xlab=expression(omega (degrees)),
     ylab=expression(beta (degrees)))

#With Backtracking
prodHorizBT<-prodGCPV(lat=lat, dataRad=prom, sample='10 min',
    modeTrk='horiz',
    modeShd='bt', betaLim=60,
    distances=distHoriz,
    struct=structHoriz)

print(prodHorizBT)

xyplot(r2d(Beta)~r2d(w),
     data=prodHorizBT,
     type='l',
     main='Inclination angle of a horizontal axis tracker\n with backtracking',
     xlab=expression(omega (degrees)),
     ylab=expression(beta (degrees)))

compare(prodFixed, prod2x, prodHoriz, prod2xShd,
       prodHorizShd, prodHorizBT)

compareLosses(prodFixed, prod2x, prodHoriz, prod2xShd,
       prodHorizShd, prodHorizBT)

compareYf2 <- mergesolaR(prodFixed, prod2x, prodHoriz, prod2xShd,
       prodHorizShd, prodHorizBT)
xyplot(compareYf2, superpose=TRUE,
ylab='kWh/kWp', main='Daily productivity', auto.key=list(space='right'))



