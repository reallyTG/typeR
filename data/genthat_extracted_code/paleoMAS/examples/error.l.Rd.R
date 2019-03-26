library(paleoMAS)


### Name: error.l
### Title: LOESS regression error estimation for multiple taxa
### Aliases: error.l
### Keywords: models robust

### ** Examples

data(modernq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
#if alpha and degree are selected using AIC
a.d<-akaike.all(modernq[,1],perq[,1:10])
error.l(modernq[,1],perq[,1:10],a.d)




