library(benchden)


### Name: dhisto
### Title: 4 histogram benchmark densities
### Aliases: dhisto phisto qhisto rhisto
### Keywords: distribution datagen nonparametric

### ** Examples


# histogram and true density of "5 bin irregular"-distribution
hist(rhisto(2000,dnum=2),breaks=250, main = " ",freq=FALSE)
lines(seq(0,1,0.01),dhisto(seq(0,1,0.01),dnum=2),col="blue",lwd=1)
title(paste("sample from",nhisto(dnum=2),"density"))




