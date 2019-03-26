library(wrassp)


### Name: lpsSpectrum
### Title: lpsSpectrum
### Aliases: lpsSpectrum

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calculate lps spectrum
res <- lpsSpectrum(path2wav, toFile=FALSE)

# plot spectral values at midpoint of signal
plot(res$lps[dim(res$lps)[1]/2,], 
     type='l', 
     xlab='spectral value index', 
     ylab='spectral value')




