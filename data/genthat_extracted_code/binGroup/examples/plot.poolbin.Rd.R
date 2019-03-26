library(binGroup)


### Name: plot.poolbin
### Title: Diagnostic line fit for pool.bin objects
### Aliases: plot.poolbin
### Keywords: hplot

### ** Examples


test <- pooledBin(x=c(8,3,1,0), m=c(50,20,10,5),
n=c(10,10,10,10), pt.method="firth", ci.method="lrt")

plot(test)



