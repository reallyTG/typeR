library(IDPmisc)


### Name: MS
### Title: Spectrum Measured by a SELDI TOF Mass Spectrometer
### Aliases: MS
### Keywords: datasets

### ** Examples

data(MS)

MS1 <- log10(MS[MS$mz>12000&MS$mz<1e5,])
P <- peaks(MS1, minPH=0.025, minPW=0.0015)

plot(MS1, ty="l", xlim=c(4.15,5))
points(P,col="red")




