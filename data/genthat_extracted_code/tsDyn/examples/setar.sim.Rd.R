library(tsDyn)


### Name: setar.sim
### Title: Simulation and bootstrap of Threshold Autoregressive model
### Aliases: setar.sim
### Keywords: ts

### ** Examples


##Simulation of a TAR with 1 threshold
TvarMat <- c(2.9,-0.4,-0.1,-1.5, 0.2,0.3)
sim<-setar.sim(B=TvarMat,lag=2, type="simul", nthresh=1, Thresh=2, starting=c(2.8,2.2))$serie
mean(ifelse(sim>2,1,0))	#approximation of values over the threshold

#check the result
selectSETAR(sim, m=2)

##Bootstrap a TAR with two threshold (three regimes)
sun<-(sqrt(sunspot.year+1)-1)*2
setar.sim(data=sun,nthresh=2,n=500, type="boot", Thresh=c(6,9))$serie

##Check the bootstrap
cbind(setar.sim(data=sun,nthresh=2,n=500, type="check", Thresh=c(6,9))$serie,sun)




