library(geoR)


### Name: kattegat
### Title: Kattegat basin salinity data
### Aliases: kattegat
### Keywords: datasets

### ** Examples

plot(c(550,770),c(6150,6420),type="n",xlab="X UTM",ylab="Y UTM")
points(kattegat, add=TRUE)
lapply(kattegat$dk, lines, lwd=2)



