library(extremefit)


### Name: hill.adapt
### Title: Compute the extreme quantile procedure
### Aliases: hill.adapt

### ** Examples


x <- abs(rcauchy(100))
HH <- hill.adapt(x, weights=rep(1, length(x)), initprop = 0.1,
               gridlen = 100 , r1 = 0.25, r2 = 0.05, CritVal=10,plot=TRUE)
#the critical value 10 is assiociated to the rectangular kernel.
HH$Xadapt # is the adaptive threshold
HH$hadapt # is the adaptive parameter of the Pareto distribution




