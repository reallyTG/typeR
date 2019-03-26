library(astrochron)


### Name: mtmAR
### Title: Intermediate spectrum test of Thomson et al. (2001)
### Aliases: mtmAR

### ** Examples

# generate example series with periods of 400 ka, 100 ka, 40 ka and 20 ka
ex = cycles(freqs=c(1/400,1/100,1/40,1/20),start=1,end=1000,dt=5)

# add AR1 noise
noise = ar1(npts=200,dt=5,sd=.5)
ex[2] = ex[2] + noise[2]

# MTM spectral analysis, with conventional AR1 noise test
pl(1,title="mtmAR")
mtmAR(ex)



