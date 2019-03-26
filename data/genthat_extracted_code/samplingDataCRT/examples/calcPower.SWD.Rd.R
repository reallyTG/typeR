library(samplingDataCRT)


### Name: calcPower.SWD
### Title: Power calculation within stepped wedge design model by Hussey
###   et.al or Heo&Kim
### Aliases: calcPower.SWD

### ** Examples

noCl<-10
noT<-6
switches<-2
DM<-designMatrix(noCl,noT,switches)
sigma.e <- 2
sigma.alpha <- 2   
#Power for cross-sectional SWD design by formula of Hussey&Hughes 
calcPower.SWD(ThetaEst=1,Design=DM, sigmaq=sigma.e^2, tauq=sigma.alpha^2, time=FALSE)
calcPower.SWD(ThetaEst=1,Design=DM, sigmaq=sigma.e^2, tauq=sigma.alpha^2, time=TRUE)
#Power for longitudinal SWD design by formula of Heo&Kim 
DM.new<-NULL
for(i in 1:dim(DM)[2]){
DM.new<-cbind(DM.new,DM[,i], DM[,i])
}
s.e <- sqrt(7/10)
s <- sqrt(2/10)
s.a <- sqrt(1/10 )
K<- 10 #number of participants within each 'cell'
calcPower.SWD(ThetaEst=1, Design=DM.new, s.a^2, s^2, s.e^2,  noSub=K,  type="longitudinal")



