library(W2CWM2C)


### Name: WMCC
### Title: Wavelet multiple cross-correlation (multivariate case).
### Aliases: WMCC wmcc
### Keywords: Multi-variate Wavelet Multiple cross-correlation

### ** Examples


 library("colorspace")
 library("wavemulcor")
 library("W2CWM2C")
 data(dataexample)

 #:: Figure 5 (Polanco-Martinez and Fernandez-Macho (2014).

 #:: Convert. log return using: ln(t + deltat) - ln(t) 
 #:: The application in this example is with stock market 
 #:: indexes and it is common to use log returns instead of
 #:: raw data. Other kinds of pre-processing data are possible. 

 dataexample  <- dataexample[-1] #remove the dates!
 lrdatex      <- apply(log(dataexample), 2, diff)
 inputDATA    <- ts(lrdatex, start=1, frequency=1)

 Wname     <- "la8"
 J         <- 8
 lmax      <- 30
 compWCC   <- WMCC(inputDATA, Wname, J, lmax, device="screen", NULL,
                   NULL, NULL, NULL, NULL)



