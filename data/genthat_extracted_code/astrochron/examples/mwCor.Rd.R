library(astrochron)


### Name: mwCor
### Title: Calculate moving window correlation coefficient for two
###   stratigraphic series, using a 'dynamic window'
### Aliases: mwCor

### ** Examples

# generate example series
ex <- cycles(freqs=c(1/40,1/20),noisevar=.2)

# add second variable
ex[3] <- cycles(freqs=c(1/40,1/20),noisevar=0.2)[2]

# jitter sampling times
ex[1]=ex[1]+rnorm(500,sd=5)
# sort
ex = ex[order(ex[1],na.last=NA,decreasing=FALSE),]

# run mwCor
mwCor(ex,win=50)



