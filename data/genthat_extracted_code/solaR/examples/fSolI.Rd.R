library(solaR)


### Name: C_fSolI
### Title: Instantaneous apparent movement of the Sun from the Earth
### Aliases: fSolI
### Keywords: utilities

### ** Examples

###Angles for one day
BTd=fBTd(mode='serie')

#North hemisphere
lat=37.2
solD<-fSolD(lat,BTd[100])
solI<-fSolI(solD, sample='hour')
print(solI)

#South hemisphere
lat=-37.2;
solDs<-fSolD(lat,BTd[283])
solIs<-fSolI(solDs, sample='hour')
print(solIs)

 ###Angles for the 12 average days
lat=37.2;
solD<-fSolD(lat,BTd=fBTd(mode='prom'))
solI<-fSolI(solD, sample='10 min', keep.night=FALSE)

library(lattice)
library(latticeExtra)

###Solar elevation angle vs. azimuth.
#This kind of graphics is useful for shadows calculations
mon=month.abb
p<-xyplot(r2d(AlS)~r2d(AzS),
    groups=month,
    data=solI, type='l', col='black',
    xlab=expression(psi[s]),ylab=expression(gamma[s]))

plab<-p + glayer({
  idx <- round(length(x)/2+1)
  panel.text(x[idx], y[idx], mon[group.value], pos=3, offset=0.2, cex=0.8)})

print(plab)




