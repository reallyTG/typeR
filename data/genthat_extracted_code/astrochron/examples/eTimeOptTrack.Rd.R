library(astrochron)


### Name: eTimeOptTrack
### Title: Track eTimeOpt r2 maxima
### Aliases: eTimeOptTrack

### ** Examples

## No test: 
# generate a test signal with precession and eccentricity
ex=cycles(freqs=c(1/405.6795,1/130.719,1/123.839,1/98.86307,1/94.87666,1/23.62069, 
1/22.31868,1/19.06768,1/18.91979),end=4000,dt=5)

# convert to meters with a linearly increasing sedimentation rate from 0.01 m/kyr to 0.03 m/kyr
ex=sedRamp(ex,srstart=0.01,srend=0.03)

# interpolate to median sampling interval
ex=linterp(ex)

# evaluate precession & eccentricity power, and precession modulations
res=eTimeOpt(ex,win=20,step=1,fit=1,output=1)

# extract the optimal fits for the power optimization
sedrates=eTimeOptTrack(res[2])

# extract the optimal fits for the envelope*power optimization
sedrates=eTimeOptTrack(res[3])

# you can also interactively track the results using functions 'trackPeak' and 'tracePeak'
#  evaluate the results from the power optimization
sedrates=trackPeak(res[2])
sedrates=tracePeak(res[2])

#  evaluate the results from the envelope*power optimization optimization
sedrates=trackPeak(res[3])
sedrates=tracePeak(res[3])
## End(No test)



