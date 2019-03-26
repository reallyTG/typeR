library(astrochron)


### Name: traceFreq
### Title: Frequency-domain minimal tuning: Use interactive graphical
###   interface to trace frequency drift
### Aliases: traceFreq

### ** Examples

## No test: 
# Check to see if this is an interactive R session, for compliance with CRAN standards.
# YOU CAN SKIP THE FOLLOWING LINE IF YOU ARE USING AN INTERACTIVE SESSION.
if(interactive()) {

# Generate example series with 3 terms using function 'cycles'.
# Then convert from time to space with sedimentation rate that increases from 1 to 5 cm/ka, using 
# function 'sedramp'.
# Finally interpolate to median sampling interval using function 'linterp'.
dat=linterp(sedRamp(cycles(freqs=c(1/100,1/40,1/20),start=1,end=2500,dt=5)))

# EHA anlaysis, output amplitude results
out=eha(dat,output=3)

## Interactively track frequency drift
freq=traceFreq(out)

}
## End(No test)



