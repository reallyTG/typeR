library(RSEIS)


### Name: DOsgram
### Title: Gabor transform
### Aliases: DOsgram
### Keywords: misc

### ** Examples


data(KH)
###   swig(KH)

Xamp  <-  KH$JSTR[[1]]
Xamp  <-  Xamp[57914:72989]

Nfft <- 1024   ###  fft length
Ns <- 512      ###  number of samples in a window
Nov <- 480    ###  number of samples of overlap per window
fl <- 0        ###  low frequency to return
fh <- 12     ###  high frequency to return


EV  <-  DOsgram(Xamp, DT = 0.008, multi = 1, scale.def = 0,
TWIN = 2, TSKIP = 0.2, PCTTAP = 0.05)









