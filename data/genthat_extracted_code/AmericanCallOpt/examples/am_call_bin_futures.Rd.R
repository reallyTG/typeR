library(AmericanCallOpt)


### Name: am_call_bin_futures
### Title: Binomial pricing of a futures American call
### Aliases: am_call_bin_futures
### Keywords: am_call_bin_futures

### ** Examples

rm(list=ls())

F<-50 
K<-45
r<-0.08 
sigma<-0.2
t<-0.5
steps<-100

call_price_bin_futures<-am_call_bin_futures(F, K, r, sigma, t, steps)



