library(emuR)


### Name: dbnorm
### Title: Function to dB-normalise spectral objects
### Aliases: dbnorm
### Keywords: manip

### ** Examples


# normalise to - 40 dB at 1500 Hz
res = dbnorm(e.dft, 1500, 0)
# compare the two
ylim = range(c(res, e.dft))
plot(e.dft, ylim=ylim, type="l")
par(new=TRUE)
plot(res, ylim=ylim, type="l", col=2)





