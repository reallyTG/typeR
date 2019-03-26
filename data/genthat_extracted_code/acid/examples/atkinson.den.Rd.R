library(acid)


### Name: atkinson.den
### Title: Atkinson Index for an Income Distribution
### Aliases: atkinson.den

### ** Examples

## without point mass at zero
incs<-seq(0,500,by=0.01)
dens<-dLOGNO(incs,2,1)
plot(incs,dens,type="l",xlim=c(0,100))
atkinson.den(incs=incs,dens=dens,epsilon=1)$AIM
atkinson(rLOGNO(50000,2,1),epsilon=1)
atkinson.den(incs=incs,dens=dens,epsilon=0.5)$AIM
atkinson(rLOGNO(50000,2,1),epsilon=0.5)

## with point mass at zero
incs<-c(seq(0,100,by=0.1),seq(100.1,1000,by=1),seq(1001,10000,by=10))
dens<-dLOGNO(incs,2,1)/2
dens[1]<-0.5
plot(incs,dens,type="l",ylim=c(0,max(dens[-1])),xlim=c(0,100))
#without zero approx zeros
atkinson.den(incs=incs,dens=dens,epsilon=1,pm0=0.5)$AIM
atkinson(c(rep(0,25000),rLOGNO(25000,2,1)),epsilon=1)
atkinson.den(incs=incs,dens=dens,epsilon=0.5,pm0=0.5)$AIM
atkinson(c(rep(0,25000),rLOGNO(25000,2,1)),epsilon=0.5)
#with zero approximation 
atkinson.den(incs=incs,dens=dens,epsilon=0.5,pm0=0.5,zero.approx=1)$AIM
atkinson(c(rep(1,25000),rLOGNO(25000,2,1)),epsilon=0.5)
atkinson.den(incs=incs,dens=dens,epsilon=1,pm0=0.5,zero.approx=0.01)$AIM
atkinson(c(rep(0.01,250000),rLOGNO(250000,2,1)),epsilon=1)




