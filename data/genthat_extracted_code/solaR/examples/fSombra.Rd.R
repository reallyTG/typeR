library(solaR)


### Name: C_fSombra
### Title: Shadows on PV systems
### Aliases: fSombra fSombra2X fSombra6 fSombraHoriz fSombraEst
### Keywords: utilities

### ** Examples

lat=37.2;
sol<-calcSol(lat, fBTd(mode='prom'), sample='10 min', keep.night=FALSE)
angGen<-fTheta(sol, beta=35);
Angles=CBIND(as.zooI(sol), angGen)

###Two-axis tracker
#Symmetric grid
distances=data.frame(Lew=40,Lns=30,H=0)
struct=list(W=23.11, L=9.8, Nrow=2, Ncol=8)

ShdFactor<-fSombra6(Angles, distances, struct, prom=FALSE)

Angles$FS=ShdFactor
xyplot(FS~w, groups=month, data=Angles,
    type='l',auto.key=list(space='right', lines=TRUE, points=FALSE))

#Symmetric grid defined with a five rows data.frame
distances=data.frame(Lew=c(-40,0,40,-40,40),Lns=c(30,30,30,0,0),H=0)
ShdFactor2<-fSombra6(Angles, distances, struct,prom=FALSE)

#of course, with the same result
identical(coredata(ShdFactor), coredata(ShdFactor2))



