library(wrassp)


### Name: dftSpectrum
### Title: dftSpectrum
### Aliases: dftSpectrum

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate dft spectrum
res <- dftSpectrum(path2wav, toFile=FALSE)

# plot spectral values at midpoint of signal
plot(res$dft[dim(res$dft)[1]/2,], 
     type='l', 
     xlab='spectral value index', 
     ylab='spectral value')
     



