library(growthrates)


### Name: [,multiple_fits,ANY,missing-method
### Title: Extract or Replace Parts of a 'multiple_fits' Object
### Aliases: [,multiple_fits,ANY,missing-method
###   [[,multiple_fits,ANY,missing-method

### ** Examples


data(bactgrowth)
L <- all_splines(value ~ time | strain + conc +replicate, data=bactgrowth)

coef(L[[1]])

plot(L[["R:0:2"]])

par(mfrow=c(2, 2))
plot(L[1:4])




