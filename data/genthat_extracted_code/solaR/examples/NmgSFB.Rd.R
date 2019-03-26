library(solaR)


### Name: C_NmgPVPS
### Title: Nomogram of a photovoltaic pumping system
### Aliases: NmgPVPS
### Keywords: utilities

### ** Examples

Pg=seq(4000,8000,by=100);
H=seq(120,150,by=5);

data(pumpCoef)

CoefSP8A44<-subset(pumpCoef, Qn==8&stages==44)

NmgSP8A44<-NmgPVPS(pump=CoefSP8A44,Pg=Pg,H=H,Gd=5000,
     title='Choice of Pump', theme=custom.theme())



