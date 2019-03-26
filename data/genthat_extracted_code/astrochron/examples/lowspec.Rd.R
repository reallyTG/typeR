library(astrochron)


### Name: lowspec
### Title: Robust Locally-Weighted Regression Spectral Background
###   Estimation
### Aliases: lowspec

### ** Examples

# generate example series with periods of 400 ka, 100 ka, 40 ka and 20 ka
ex = cycles(freqs=c(1/400,1/100,1/40,1/20),start=1,end=1000,dt=5)

# add AR1 noise
noise = ar1(npts=200,dt=5,sd=.5)
ex[2] = ex[2] + noise[2]

# LOWSPEC analysis
pl(1, title="lowspec")
lowspec(ex)

# compare to MTM spectral analysis, with conventional AR1 noise test
pl(1,title="mtm")
mtm(ex,ar1=TRUE)

# compare to ML96 analysis
pl(1, title="mtmML96")
mtmML96(ex)

# compare to amplitudes from eha
pl(1,title="eha")
eha(ex,tbw=3,win=1000,pad=1000)



