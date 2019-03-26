library(wrassp)


### Name: cepstrum
### Title: cepstrum
### Aliases: cepstrum

### ** Examples

# get path to audio file
path2wav <- list.files(system.file("extdata", package = "wrassp"), 
                       pattern = glob2rx("*.wav"), 
                       full.names = TRUE)[1]

# calulate cepstrum
res <- cepstrum(path2wav, toFile=FALSE)

# plot cepstral values at midpoint of signal
plot(res$cep[dim(res$cep)[1]/2,], 
     type='l', 
     xlab='cepstral value index', 
     ylab='cepstral value')
     



