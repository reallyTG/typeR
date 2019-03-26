library(astrochron)


### Name: integratePower
### Title: Determine the total power within a given bandwidth
### Aliases: integratePower

### ** Examples

# generate etp signal over past 10 Ma
ex=etp(tmax=10000)

# evolutive power
pwr=eha(ex,win=500,fmax=.1,pad=2000,output=2,pl=2)

# integrate power from main obliquity term
integratePower(pwr,flow=0.02,fhigh=0.029,npts=501,pad=2000)



