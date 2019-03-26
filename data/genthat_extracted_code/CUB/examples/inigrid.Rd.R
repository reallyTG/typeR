library(CUB)


### Name: inigrid
### Title: Grid-based preliminary parameter estimates for CUB models
### Aliases: inigrid
### Keywords: htest utilities

### ** Examples

m<-9
x<-c(0.1,0.4,0.6,0.8)
y<-c(0.2, 0.5,0.7)
freq<-c(10,24,28,36,50,43,23,12,5)
ini<-inigrid(m,freq,x,y)
pai<-ini[1]
csi<-ini[2]



