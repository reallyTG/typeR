library(astrochron)


### Name: synthStrat
### Title: Synthesize stratigraphy from forcing function
### Aliases: synthStrat

### ** Examples

# EX.1: precession, unclipped
signal=etp(tmin=8400,tmax=8900,pWt=1,oWt=0,eWt=0)
synthStrat(signal,nfacies=4,clip=FALSE,genplot=2)

# EX.2: more finely resolved facies
#synthStrat(signal,nfacies=15,clip=FALSE,genplot=2)

# EX.3: couplets
#synthStrat(signal,nfacies=2,clip=FALSE,genplot=2)

# EX.4: precession, clipped
#synthStrat(signal,nfacies=4,genplot=2)

# EX.5: noise
noise=ar1(npts=501,rho=0.8)
#synthStrat(noise,nfacies=4,genplot=2)

# EX.6: precession + noise 
#signal2=signal
#signal2[2]=signal2[2]+0.75*noise[2]
#synthStrat(signal2,nfacies=4,genplot=2)

# EX.7: p-0.5t, clipped (demonstrates interference pattern; compare with EX.4
#signal3=etp(tmin=8400,tmax=8900,pWt=1,oWt=-0.5,eWt=0)
#synthStrat(signal3,nfacies=4,genplot=2)

# EX.8: ice sheet model, using p-0.5t
#ice=imbrie()
#synthStrat(ice,nfacies=5,clip=FALSE,genplot=2)

# EX.9: precession, clipped, ramping sedimentation rate
#synthStrat(linterp(sedRamp(signal,genplot=FALSE),genplot=FALSE),nfacies=6,
# clip=TRUE,genplot=2,fmax=10)




