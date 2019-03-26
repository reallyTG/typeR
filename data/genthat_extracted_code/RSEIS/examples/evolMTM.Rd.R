library(RSEIS)


### Name: evolMTM
### Title: Evolutive Multi-taper Spectrum
### Aliases: evolMTM
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


Nfft<-4096   ###  fft length
Ns<-512      ###  number of samples in a window
Nov<-480    ###  number of samples of overlap per window
fl<-0        ###  low frequency to return
fh<-12     ###  high frequency to return

EV <- evolMTM(Xamp, dt = dt, numf = Nfft, Ns = Ns, Nov = Nov, fl = fl, fh
= fh)


PE <- plotevol(EV, log=1, fl=0.01, fh=fh, col=rainbow(100), ygrid=FALSE,
STAMP="", STYLE="ar")


##   compare with:
## EVf <- evolfft(Xamp, dt = dt, Nfft =Nfft , Ns =Ns , Nov =Nov , fl =fl, fh = fh)

##  PE <- plotevol(EVf, log=1, fl=fl, fh=fh, col=rainbow(100), ygrid=FALSE,STAMP="", STYLE="fft")






