library(W2CWM2C)


### Name: WC
### Title: Wavelet correlation (bivariate case) pairwise comparisons.
### Aliases: WC wc
### Keywords: bi-variate Pairwise comparisons Wavelet Correlation

### ** Examples

## Figure 1 (Polanco-Martinez and Fernandez-Macho 2014). 

 library("colorspace")
 library("waveslim")
 library("W2CWM2C") 
 data(dataexample)   

 #:: Convert. log returns using: ln(t + deltat) - ln(t) 
 #:: The application in this example is with stock market 
 #:: indexes and it is common to use log returns instead of
 #:: raw data. Other kinds of pre-processing data are possible. 

 dataexample  <- dataexample[-1] # remove dates!
 dataexample  <- dataexample[,1:5]
 lrdatex      <- apply(log(dataexample), 2, diff)
 inputDATA    <- ts(lrdatex, start=1, frequency=1) 

 #Input parameters 
  Wname       <- "la8"
  J           <- 8 
  compWC      <- WC(inputDATA, Wname, J, device="screen", NULL,
                  NULL, NULL, NULL, NULL) 



