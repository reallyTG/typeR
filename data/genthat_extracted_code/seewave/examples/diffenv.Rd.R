library(seewave)


### Name: diffenv
### Title: Difference between two amplitude envelopes
### Aliases: diffenv
### Keywords: dplot ts

### ** Examples

data(tico) ; tico <- tico@left
data(orni) ; orni <- orni@left
# selection in tico of two waves with similar duration
tico2<-tico[1:length(orni)]
diffenv(tico2,orni,f=22050,plot=TRUE)
# smoothing the envelope gives a better graph but slightly changes the result
diffenv(tico2,orni,f=22050,msmooth=c(20,0),plot=TRUE)



