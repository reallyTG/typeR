library(solaR)


### Name: C_fSolD
### Title: Daily apparent movement of the Sun from the Earth
### Aliases: fSolD
### Keywords: utilities

### ** Examples

BTd=fBTd(mode='serie')

lat=37.2
fSolD(lat,BTd[100])
fSolD(lat,BTd[100], method='strous')
fSolD(lat,BTd[100], method='spencer')
fSolD(lat,BTd[100], method='cooper')

lat=-37.2
fSolD(lat,BTd[283])

#Solar angles along the year
SolD<-fSolD(lat,BTd=fBTd())

library(lattice)
xyplot(SolD)

#Calculation of the daylength for several latitudes
library(latticeExtra)

Lats=c(-60,-40,-20,0,20,40,60)
NomLats=ifelse(Lats>0, paste(Lats,'N', sep=''), paste(abs(Lats), 'S',
sep=''))
NomLats[Lats==0]='0'

mat=matrix(nrow=365, ncol=length(Lats))
colnames(mat)=NomLats
WsZ=zoo(mat, fBTd(mode='serie'))

for (i in seq_along(Lats)){
    SolDaux<-fSolD(lat=Lats[i],BTd=fBTd(mode='serie'));
    WsZ[,i]<-r2h(2*abs(SolDaux$ws))}

p=xyplot(WsZ, superpose=TRUE,
        ylab=expression(omega[s] (h)), auto.key=FALSE)
plab<-p+glayer(panel.text(x[1], y[1], NomLats[group.number], pos=2))
print(plab)



