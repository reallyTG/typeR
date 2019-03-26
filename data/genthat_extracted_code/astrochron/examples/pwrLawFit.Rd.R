library(astrochron)


### Name: pwrLawFit
### Title: Estimate power law (1/f) fit to power spectrum
### Aliases: pwrLawFit

### ** Examples

# generate example series with periods of 400 ka, 100 ka, 40 ka and 20 ka
ex = cycles(freqs=c(1/400,1/100,1/40,1/20),start=1,end=1000,dt=5)

# add AR1 noise
noise = ar1(npts=200,dt=5,sd=.5)
ex[2] = ex[2] + noise[2]

# calculate periodogram
res=periodogram(ex,output=1)

pwrLawFit(cb(res,c(1,3)))



