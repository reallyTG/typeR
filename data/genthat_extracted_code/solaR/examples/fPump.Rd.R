library(solaR)


### Name: C_fPump
### Title: Performance of a centrifugal pump
### Aliases: fPump
### Keywords: utilities

### ** Examples

library(latticeExtra)

data(pumpCoef)
CoefSP8A44<-subset(pumpCoef, Qn==8&stages==44)

fSP8A44<-fPump(pump=CoefSP8A44,H=40)
SP8A44=with(fSP8A44,{
                Pac=seq(lim[1],lim[2],by=100)
                Pb=fPb(Pac)
                etam=Pb/Pac
                Ph=fPh(Pac)
                etab=Ph/Pb
                f=fFreq(Pac)
                Q=fQ(Pac)
                result=data.frame(Q,Pac,Pb,Ph,etam,etab,f)})

#Efficiency of the motor, pump and the motor-pump
SP8A44$etamb=with(SP8A44,etab*etam)
lab=c(expression(eta[motor]), expression(eta[pump]), expression(eta[mp]))
p<-xyplot(etam+etab+etamb~Pac,data=SP8A44,type='l', ylab='Efficiency')
p+glayer(panel.text(x[1], y[1], lab[group.number], pos=3))

#Mechanical, hydraulic and electrical power
lab=c(expression(P[pump]), expression(P[hyd]))
p<-xyplot(Pb+Ph~Pac,data=SP8A44,type='l', ylab='Power (W)', xlab='AC Power (W)')
p+glayer(panel.text(x[length(x)], y[length(x)], lab[group.number], pos=3))

#Flow and electrical power
xyplot(Q~Pac,data=SP8A44,type='l')



