library(astrochron)


### Name: timeOptSim
### Title: Monte Carlo simulation for TimeOpt
### Aliases: timeOptSim

### ** Examples

## No test: 
# generate a test signal with precession and eccentricity
ex=etp(tmin=1,tmax=1000,dt=5,pWt=1,oWt=0,eWt=1,esinw=TRUE,genplot=FALSE,verbose=FALSE)
# convert to meters with sedimentation rate of 2 cm/kyr
ex[1]<-ex[1]*0.02
# evaluate with timeOptSim. be patient, this may take a while to run.
timeOptSim(ex,sedmin=0.5,sedmax=5,numsed=100)
## End(No test)



