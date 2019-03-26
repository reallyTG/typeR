library(RSEIS)


### Name: evolAR
### Title: Evolutive Auto-Regressive Spectrum
### Aliases: evolAR
### Keywords: misc

### ** Examples

data(KH)
###   swig(KH)

Xamp <- KH$JSTR[[1]]

dt <- KH$dt[1]
plot(seq(from=0, length=length(Xamp), by=dt), Xamp, type='l')
##  limit the trace, somewhat
Xamp <- Xamp[12670:22669]
plot(seq(from=0, length=length(Xamp), by=dt), Xamp, type='l')


Nfft<-1024   ###  fft length
Ns<-512      ###  number of samples in a window
Nov<-480    ###  number of samples of overlap per window
fl<-0        ###  low frequency to return
fh<-12     ###  high frequency to return

EV <- evolAR(Xamp, dt = dt, numf =Nfft , pord = 100, Ns = Ns,
       Nov = Nov, fl = fl, fh = fh)


PE <- plotevol(EV, log=1, fl=0.01, fh=fh,
      col=rainbow(100), ygrid=FALSE,
      STAMP="", STYLE="ar")





