library(seewave)


### Name: istft
### Title: Inverse of the short-term Fourier transform
### Aliases: istft
### Keywords: ts

### ** Examples

## Not run: 
##D # STFT and iSTFT parameters
##D wl <- 1024
##D ovlp <- 75
##D # reconstruction of the tico sound from the stft complex data matrix
##D data(tico)
##D data <- spectro(tico, wl=wl, ovlp=ovlp, plot=FALSE, norm=FALSE, dB=NULL, complex=TRUE)$amp
##D res <- istft(data, ovlp=ovlp, wn="hanning", wl=wl, f=22050, out="Wave")
##D spectro(res)
##D # a strange frequency filter
##D n <- noisew(d=1, f=44100)
##D data <- spectro(n, f=44100, wl=wl, ovlp=ovlp, plot=FALSE, norm=FALSE, dB=NULL, complex=TRUE)$amp
##D data[64:192, 6:24] <- 0 
##D nfilt <- istft(data, f=8000, wl=wl, ovlp=ovlp, output="Wave")
##D spectro(nfilt, wl=wl, ovlp=ovlp)
## End(Not run)



