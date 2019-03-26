library(wrassp)


### Name: cssSpectrum
### Title: cssSpectrum
### Aliases: cssSpectrum

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate cepstrally smoothed spectrum
res <- cssSpectrum(path2wav, toFile=FALSE)

# plot spectral values at midpoint of signal
plot(res$css[dim(res$css)[1]/2,], 
     type='l', 
     xlab='spectral value index', 
     ylab='spectral value')
     



