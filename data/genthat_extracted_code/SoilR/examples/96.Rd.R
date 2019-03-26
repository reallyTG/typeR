library(SoilR)


### Name: TwopMMmodel
### Title: Implementation of a two-pool Michaelis-Menten model
### Aliases: TwopMMmodel

### ** Examples


days=seq(0,1000,0.5)

#Run the model with default parameter values
MMmodel=TwopMMmodel(t=days,ival=c(100,10))
Cpools=getC(MMmodel)

#Time solution
matplot(days,Cpools,type="l",ylab="Concentrations",xlab="Days",lty=1,ylim=c(0,max(Cpools)*1.2))
legend("topleft",c("SOM-C", "Microbial biomass"),lty=1,col=c(1,2),bty="n")

ks=0.000018
kb=0.007
r=0.6
ADD=3.2

#Analytical solution of fixed points
Cs=kb/((1-r)*ks)
abline(h=Cs,lty=2)

Cb=(ADD*(1-r))/(r*kb)
abline(h=Cb,lty=2,col=2)

#State-space diagram
plot(Cpools[,2],Cpools[,1],type="l",ylab="SOM-C",xlab="Microbial biomass")

#Microbial biomass over time
plot(days,Cpools[,2],type="l",col=2,xlab="Days",ylab="Microbial biomass")

#The default parameterization exhaust the microbial biomass.
#A different behavior is obtained by increasing ks and decreasing kb
MMmodel=TwopMMmodel(t=days,ival=c(972,304) ,Af=3,kb=0.0000001)
Cpools=getC(MMmodel)

matplot(days,Cpools,type="l",ylab="Concentrations",xlab="Days",lty=1,ylim=c(0,max(Cpools)*1.2))
legend("topleft",c("SOM-C", "Microbial biomass"),lty=1,col=c(1,2),bty="n")

plot(Cpools[,2],Cpools[,1],type="l",ylab="SOM-C",xlab="Microbial biomass")

plot(days,Cpools[,2],type="l",col=2,xlab="Days",ylab="Microbial biomass")




