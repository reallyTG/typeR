library(AmericanCallOpt)


### Name: am_call_bin_currency
### Title: Binomial pricing of an American call on currency futures
### Aliases: am_call_bin_currency
### Keywords: am_call_bin_currency

### ** Examples

rm(list=ls())

S<-50 
K<-52
r<-0.08 
r_f<-0.05
sigma<-0.2 
t<-0.5
steps<-100

call_price_bin_currency<-am_call_bin_currency(S, K, r, r_f, sigma, t, steps)



