library(solaR)


### Name: A7_optimShd
### Title: Shadows calculation for a set of distances between elements of a
###   PV grid connected plant.
### Aliases: optimShd
### Keywords: utilities constructors

### ** Examples

library(lattice)
library(latticeExtra)

lat=37.2;
G0dm=c(2766, 3491, 4494, 5912, 6989, 7742, 7919, 7027, 5369, 3562, 2814,
2179)
Ta=c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2, 15.2)
prom=list(G0dm=G0dm, Ta=Ta)

###Two-axis trackers
struct2x=list(W=23.11, L=9.8, Nrow=2, Ncol=8)
dist2x=list(Lew=c(30,50),Lns=c(20,50))

#Monthly averages
ShdM2x<-optimShd(lat=lat, dataRad=prom, modeTrk='two',
        modeShd=c('area','prom'), distances=dist2x, struct=struct2x, res=5)

shadeplot(ShdM2x)

pLew=xyplot(Yf~GRR,data=ShdM2x,groups=factor(Lew),type=c('l','g'),
    main='Productivity for each Lew value')
pLew+glayer(panel.text(x[1], y[1], group.value))

pLns=xyplot(Yf~GRR,data=ShdM2x,groups=factor(Lns),type=c('l','g'),
    main='Productivity for each Lns value')
pLns+glayer(panel.text(x[1], y[1], group.value))

###Horizontal axis tracker
structHoriz=list(L=4.83);
distHoriz=list(Lew=structHoriz$L*c(2,5));

#Without backtracking
Shd12Horiz<-optimShd(lat=lat, dataRad=prom,
        modeTrk='horiz',
        betaLim=60,
        distances=distHoriz, res=2,
        struct=structHoriz,
        modeShd='area')

shadeplot(Shd12Horiz)

xyplot(diff(Yf)~GRR[-1],data=Shd12Horiz,type=c('l','g'))

#with Backtracking
Shd12HorizBT<-optimShd(lat=lat, dataRad=prom,
        modeTrk='horiz',
        betaLim=60,
        distances=distHoriz, res=1,
        struct=structHoriz,
        modeShd='bt')

shadeplot(Shd12HorizBT)
xyplot(diff(Yf)~GRR[-1],data=Shd12HorizBT,type=c('l','g'))


###Fixed system
structFixed=list(L=5);
distFixed=list(D=structFixed$L*c(1,3));
Shd12Fixed<-optimShd(lat=lat, dataRad=prom,
        modeTrk='fixed',
        distances=distFixed, res=1,
        struct=structFixed,
        modeShd='area')
shadeplot(Shd12Fixed)



