library(AmericanCallOpt)


### Name: am_call_partials
### Title: Hedge parameters of a standard American call option using a
###   binomial tree
### Aliases: am_call_partials
### Keywords: am_call_partials

### ** Examples

rm(list=ls())

S<-100 
K<-100
r<-0.1 
sigma<-0.25
t<-1.0 
steps<-100

hedge<-am_call_partials(S, K, r, sigma, t, steps)



