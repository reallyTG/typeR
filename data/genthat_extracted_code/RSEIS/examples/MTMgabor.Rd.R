library(RSEIS)


### Name: MTMgabor
### Title: Evolutive MTM Spectrum
### Aliases: MTMgabor
### Keywords: misc

### ** Examples



## Not run: 
##D data(KH)
##D ###   swig(KH)
##D 
##D Xamp <- KH$JSTR[[1]]
##D Nfft <- 1024   ###  fft length
##D Ns <- 512      ###  number of samples in a window
##D Nov <- 480    ###  number of samples of overlap per window
##D fl <- 0        ###  low frequency to return
##D fh <- 12     ###  high frequency to return
##D  dt  <-  KH$dt[1]
##D 
##D 
##D EV <-   MTMgabor(Xamp, dt = dt, numf =Nfft , Ns = Ns, Nov = Nov, fl = fl, fh= fh)
##D 
##D PE   <- plotevol(EV, log=1, fl=0.01, fh=fh, col=rainbow(100),
##D               ygrid=FALSE, STAMP="", STYLE="ar")
##D 
## End(Not run)





