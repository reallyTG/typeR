library(RSEIS)


### Name: get.slepians
### Title: Get Slepian Tapers
### Aliases: get.slepians
### Keywords: misc

### ** Examples


nwin <- 5
npi <- 3
npoints <- 900
sleps <- get.slepians(npoints, nwin, npi)

matplot(sleps, type='l', xlab="Index", ylab="Taper Amplitude")
legend('topleft', legend=1:nwin, lty=1:nwin, col=1:nwin)






