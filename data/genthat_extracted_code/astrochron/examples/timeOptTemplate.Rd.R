library(astrochron)


### Name: timeOptTemplate
### Title: TimeOpt analysis using variable sedimentation models
### Aliases: timeOptTemplate

### ** Examples

## Not run: 
##D # EXAMPLE (1): Differential accumulation across bedding couplets
##D ex=etp(tmin=0,tmax=1000,dt=5,pWt=1,oWt=0,eWt=1,esinw=TRUE)
##D ex2=diffAccum(ex,0.01,.05)
##D ex2=linterp(ex2)
##D # first with the nominal timeOpt approach
##D timeOpt(ex2,sedmin=1,sedmax=4,numsed=100)
##D timeOptSim(ex2,sedmin=1,sedmax=4,numsed=100,numsim=2000)
##D # then with the timeOptTemplate approach
##D timeOptTemplate(ex2,sedmin=1,sedmax=4,difmin=.5,difmax=6,numsed=100,ncores=2)
##D timeOptTemplateSim(ex2,sedmin=1,sedmax=4,difmin=.5,difmax=6,numsed=100,numsim=1000,
##D  ncores=2)
##D 
##D 
##D # EXAMPLE (2): Linear sedimentation rate increase
##D ex=etp(tmin=0,tmax=1000,dt=5,pWt=1,oWt=0,eWt=1,esinw=TRUE)
##D ex2=sedRamp(ex,srstart=0.01,srend=0.05)
##D ex2=linterp(ex2)
##D # first with the nominal timeOpt approach
##D timeOpt(ex2,sedmin=1,sedmax=4,numsed=100)
##D # then with the timeOptTemplate approach
##D # create linear model for input. the magnitude does not matter, it will be rescaled. 
##D # (it just needs to be a line)
##D template=ex2; template[2]=ex2[1]
##D timeOptTemplate(ex2,template=template,sedmin=1,sedmax=4,difmin=.5,difmax=6,numsed=100,ncores=2)
##D # view optimization procedure (must set ncores=1)
##D timeOptTemplate(ex2,template=template,sedmin=2.75,sedmax=3.25,difmin=.5,difmax=6,numsed=20,
##D ncores=1,genplot=2)
##D 
##D # EXAMPLE (3): Step increase in sedimentation rate, from 1 cm/kyr to 2 cm/kyr at 7 meters depth
##D ex=etp(tmin=0,tmax=1000,dt=5,pWt=1,oWt=0,eWt=1,esinw=TRUE)
##D ex2=ex
##D ex2[1]=ex[1]*.01
##D ex2[141:201,1]=ex2[141:201,1]*2-7
##D ex2=linterp(ex2)
##D # first with the nominal timeOpt approach
##D timeOpt(ex2,sedmin=1,sedmax=4,numsed=100)
##D # then with the timeOptTemplate approach
##D # create step model for input. the magnitude does not matter, it will be rescaled. 
##D template=ex2; template[1:140,2]=1; template[141:261,2]=2
##D timeOptTemplate(ex2,template=template,sedmin=1,sedmax=4,numsed=100,ncores=2)
##D # view optimization procedure (must set ncores=1)
##D timeOptTemplate(ex2,template=template,sedmin=1,sedmax=2,numsed=20,ncores=1,genplot=2)
##D 
##D 
##D # EXAMPLE (4): A record with a 100 kyr hiatus at 10 meters depth
##D ex=etp(tmin=0,tmax=1000,dt=5,pWt=1,oWt=0,eWt=1,esinw=TRUE)
##D ex2=delPts(ex,del=101:121)
##D # use a background sedimentation rate of 2 cm/kyr
##D ex2[1]=0:179*5*0.02
##D # first evaluate the distorted record with the nominal timeOpt approach
##D timeOpt(ex2,sedmin=1,sedmax=4,numsed=100)
##D # then with the timeOptTemplate approach
##D #  create a constant sedimentation rate template with possible hiatus of unknown
##D #  duration at 10 m
##D template=ex2; template[2]=10; template[101,2]=1
##D timeOptTemplate(ex2,template=template,sedmin=1,sedmax=3,difmax=3,numsed=100,ncores=2)
##D # now perform a finer grid search near the maximum, using power only
##D #  notice the oscillatory nature of the power fit.
##D res=timeOptTemplate(ex2,template=template,sedmin=1.5,sedmax=2,difmax=3,numsed=100,
##D  ncores=2,iopt=2,output=2)
##D # compare true eccentricity to TimeOpt-derived eccentricity
##D pl(2)
##D plot(ex,type="l",main="True Eccentricity Series",xlab="True Time (kyr)",ylab="")
##D plot(res[,1],res[,4],type="l",main="Black=TimeOpt precession AM;  Red=TimeOpt eccentricity model",
##D xlab="TimeOpt derived time (kyr)",ylab="")
##D lines(res[,1],res[,5],col="red",lwd=2)
## End(Not run)



