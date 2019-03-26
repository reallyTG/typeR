library(astrochron)


### Name: timeOptPlot
### Title: TimeOptPlot: Generate summary figure for TimeOpt analyses
### Aliases: timeOptPlot

### ** Examples

## No test: 
# generate a test signal with precession and eccentricity
ex=etp(tmin=1,tmax=1000,dt=1,pWt=1,oWt=0,eWt=1,esinw=TRUE,genplot=FALSE,verbose=FALSE)
# convert to meters with sedimentation rate of 2 cm/kyr
ex[1]<-ex[1]*0.02
# evaluate precession modulations
res1=timeOpt(ex,sedmin=0.5,sedmax=5,numsed=100,fit=1,output=1)
res2=timeOpt(ex,sedmin=0.5,sedmax=5,numsed=100,fit=1,output=2)
simres=timeOptSim(ex,sedrate=2,numsim=2000,fit=1,output=2)
timeOptPlot(ex,res1,res2,simres,flow=0.035,fhigh=0.065,roll=10^3,
 targetE=c(405.6795,130.719,123.839,98.86307,94.87666),
 targetP=c(23.62069,22.31868,19.06768,18.91979),xlab="Depth (m)",
 ylab="Value",fitR=0.832,verbose=T)
## End(No test)



