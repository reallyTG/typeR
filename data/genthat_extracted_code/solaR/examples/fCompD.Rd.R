library(solaR)


### Name: C_fCompD
### Title: Components of daily global solar irradiation on a horizontal
###   surface
### Aliases: fCompD
### Keywords: utilities

### ** Examples

lat=37.2;
BTd=fBTd(mode='serie')

SolD<-fSolD(lat, BTd[100])

G0d=zoo(5000, index(SolD))
fCompD(SolD, G0d, corr = "Page")
fCompD(SolD, G0d, corr = "CPR")

#define a function fKtd with the correlation of CPR
fKTd=function(x){(0.99*(x<=0.17))+
                 (x>0.17)*(1.188-2.272*x+9.473*x^2-21.856*x^3+14.648*x^4)}
#The same as with corr="CPR"
fCompD(SolD,G0d, corr="user",f=fKTd)

lat=-37.2;
SolDs<-fSolD(lat, BTd[283])
G0d=zoo(5000, index(SolDs))
fCompD(SolDs, G0d, corr = "CPR")

lat=37.2;
G0dm=c(2.766,3.491,4.494,5.912,6.989,7.742,7.919,7.027,5.369,3.562,2.814,2.179)*1000;
Rad=readG0dm(G0dm, lat=lat)
solD<-fSolD(lat,fBTd(mode='prom'))
fCompD(solD, Rad, corr = 'Page')



