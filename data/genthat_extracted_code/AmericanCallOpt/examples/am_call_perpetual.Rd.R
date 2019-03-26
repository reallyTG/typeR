library(AmericanCallOpt)


### Name: am_call_perpetual
### Title: Analytical pricing of an American perpetual call
### Aliases: am_call_perpetual
### Keywords: am_call_perpetual

### ** Examples

rm(list=ls())

S<-50.0 
K<-40.0
r<-0.05 
y<-0.02
sigma<-0.05

call_price_perpetual<-am_call_perpetual(S, K, r, y, sigma)



