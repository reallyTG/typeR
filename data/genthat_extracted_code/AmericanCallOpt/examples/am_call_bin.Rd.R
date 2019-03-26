library(AmericanCallOpt)


### Name: am_call_bin
### Title: Binomial pricing of a standard American call
### Aliases: am_call_bin
### Keywords: am_call_bin

### ** Examples

rm(list=ls())

S<-100
K<-100
r<-0.1
sigma<-0.25
t<-1
steps<-100

call_price_am_bin<-am_call_bin(S, K, r, sigma, t, steps)



