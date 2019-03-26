library(SoilR)


### Name: ThreepairMMmodel
### Title: Implementation of a 6-pool Michaelis-Menten model
### Aliases: ThreepairMMmodel

### ** Examples


days=seq(0,1000)

#Run the model with default parameter values
MMmodel=ThreepairMMmodel(t=days,ival=rep(c(100,10),3),ks=c(0.1,0.05,0.01),
                         kb=c(0.005,0.001,0.0005),Km=c(100,150,200),r=c(0.9,0.9,0.9),
                         ADD=c(3,1,0.5))
Cpools=getC(MMmodel)

#Time solution
matplot(days,Cpools,type="l",ylab="Concentrations",xlab="Days",lty=rep(1:2,3),
        ylim=c(0,max(Cpools)*1.2),col=rep(1:3,each=2),main="Multi-substrate microbial model")
legend("topright",c("Substrate 1", "Microbial biomass 1", 
                   "Substrate 2", "Microbial biomass 2",
                   "Substrate 3", "Microbial biomass 3"),lty=rep(1:2,3),col=rep(1:3,each=2),
       bty="n")


#State-space diagram
plot(Cpools[,2],Cpools[,1],type="l",ylab="Substrate",xlab="Microbial biomass")
lines(Cpools[,4],Cpools[,3],col=2)
lines(Cpools[,6],Cpools[,5],col=3)
legend("topright",c("Substrate-Enzyme pair 1","Substrate-Enzyme pair 2",
                    "Substrate-Enzyme pair 3"),col=1:3,lty=1,bty="n")

#Microbial biomass over time
plot(days,Cpools[,2],type="l",col=2,xlab="Days",ylab="Microbial biomass")





