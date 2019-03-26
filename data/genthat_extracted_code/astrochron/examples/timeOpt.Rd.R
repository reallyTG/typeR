library(astrochron)


### Name: timeOpt
### Title: TimeOpt: Evaluation of eccentricity-related amplitude modulation
###   and bundling in paleoclimate data
### Aliases: timeOpt

### ** Examples

# generate a test signal with precession and eccentricity
ex=etp(tmin=1,tmax=1000,dt=5,pWt=1,oWt=0,eWt=1,esinw=TRUE,genplot=FALSE,verbose=FALSE)
# convert to meters with sedimentation rate of 2 cm/kyr
ex[1]<-ex[1]*0.02
# evaluate precession modulations
timeOpt(ex,sedmin=0.5,sedmax=5,numsed=100,fit=1,output=0)
# evaluate short eccentricity modulations
timeOpt(ex,sedmin=0.5,sedmax=5,numsed=100,fit=2,output=0)



