library(AmericanCallOpt)


### Name: am_call_bin_propdiv
### Title: Binomial price of an American call with an underlying stock that
###   pays proportional dividends
### Aliases: am_call_bin_propdiv
### Keywords: am_call_bin_propdiv

### ** Examples

rm(list=ls())

S<-100 
K<-100
r<-0.10 
sigma<-0.25
t<-1
steps<-100
dividend_times<-matrix(c(0.25, 0.75))
dividend_yields<-matrix(c(0.025, 0.025)) 

call_price_bin_propdiv<-am_call_bin_propdiv(S, K, r, sigma, t, steps,
 dividend_times, dividend_yields)



