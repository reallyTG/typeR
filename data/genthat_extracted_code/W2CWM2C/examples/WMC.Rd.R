library(W2CWM2C)


### Name: WMC
### Title: Wavelet multiple correlation (multivariate case).
### Aliases: WMC wmc
### Keywords: Multi-variate Wavelet multiple correlation

### ** Examples


 library("wavemulcor")
 library("W2CWM2C")
 data(dataexample) 

 #:: Convert. log return using: ln(t + deltat) - ln(t) 
 #:: The application in this example is with stock market 
 #:: indexes and it is common to use log returns instead of 
 #:: raw data. Other kinds of pre-processing data are possible. 

 dataexample  <- dataexample[-1] #remove the dates!
 dataexample  <- dataexample[,1:5]
 lrdatex      <- apply(log(dataexample), 2, diff)
 inputDATA    <- ts(lrdatex, start=1, frequency=1)

 #Input parameters 
  Wname       <- "la8"
  J           <- 8
  compWMC     <- WMC(inputDATA, Wname, J, device="screen", NULL,
                     NULL, NULL, NULL, NULL)



