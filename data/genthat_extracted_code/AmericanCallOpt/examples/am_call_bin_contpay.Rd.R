library(AmericanCallOpt)


### Name: am_call_bin_contpay
### Title: Binomial option price with continuous payout from the underlying
###   asset
### Aliases: am_call_bin_contpay
### Keywords: am_call_bin_contpay

### ** Examples

rm(list=ls()) 

S<-100 
K<-100
r<-0.10 
y<-0.02
sigma<-0.25
t<-1
steps<-100

call_price_bin_contpay<-am_call_bin_contpay(S, K, r, y, sigma, t, steps)



