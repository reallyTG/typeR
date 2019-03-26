library(astrochron)


### Name: mtmML96
### Title: Mann and Lees (1996) robust red noise MTM analysis
### Aliases: mtmML96

### ** Examples

# generate example series with periods of 400 ka, 100 ka, 40 ka and 20 ka
ex = cycles(freqs=c(1/400,1/100,1/40,1/20),start=1,end=1000,dt=5)

# add AR1 noise
noise = ar1(npts=200,dt=5,sd=0.5)
ex[2] = ex[2] + noise[2]

# run ML96 analysis
pl(1, title="mtmML96")
mtmML96(ex)

# compare to analysis with conventional AR1 noise test
pl(1,title="mtm")
mtm(ex)

# compare to analysis with LOWSPEC
pl(1, title="lowspec")
lowspec(ex)

# compare to amplitudes from eha
pl(1,title="eha")
eha(ex,tbw=3,win=1000,pad=1000)



