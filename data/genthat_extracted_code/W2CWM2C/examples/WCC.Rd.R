library(W2CWM2C)


### Name: WCC
### Title: Wavelet cross-correlation (bivariate case).
### Aliases: WCC wcc
### Keywords: bi-variate Wavelet cross correlation

### ** Examples

## Figure 3 (Polanco-Martinez and Fernandez-Macho 2014)

 library("colorspace")
 library("waveslim")
 library("W2CWM2C")
 data(dataexample)  

 #:: Convert. log return using: ln(t + deltat) - ln(t) 
 #:: The application in this example is with stock market 
 #:: indexes and it is common to use log returns instead of
 #:: raw data. Other kinds of pre-processing data are possible. 

 dataexample  <- dataexample[-1] #remove the dates!
 DAXCAC       <- dataexample[,c(3,4)] 
 lrdatex      <- apply(log(DAXCAC), 2, diff)
 inputDATA    <- ts(lrdatex, start=1, frequency=1)

 Wname     <- "la8"
 J         <- 8
 lmax      <- 30
 compWCC   <- WCC(inputDATA, Wname, J, lmax, device="screen", NULL,
               NULL, NULL, NULL, NULL)



