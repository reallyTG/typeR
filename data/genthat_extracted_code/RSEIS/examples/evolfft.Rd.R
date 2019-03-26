library(RSEIS)


### Name: evolfft
### Title: Spectrogram fft
### Aliases: evolfft
### Keywords: misc

### ** Examples



data(CE1)

####  plot signals
plot(CE1$x, CE1$y, type='l')

###  set parameters
Nfft<-1024   ###  fft length
Ns<-250      ###  number of samples in a window
Nov<-240     ###  number of samples of overlap per window
fl<-0        ###  low frequency to return
fh<-1/(2*CE1$dt)     ###  high frequency to return

########  calculate the evolutive fft (Gabor Transform)
EV <- evolfft(CE1$y, dt =CE1$dt , Nfft = Nfft, Ns =Ns , Nov =Nov , fl =fl
, fh = 25)

### plot image, but it does not look too interesting
image(EV$DSPEC)


### plot Gabor transform with special function
PE <- plotevol(EV, log=0, fl=0.01, fh=100, col=rainbow(100), ygrid=FALSE,
STAMP="", STYLE="fft")





