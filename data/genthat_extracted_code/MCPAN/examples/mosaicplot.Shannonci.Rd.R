library(MCPAN)


### Name: mosaicdiv
### Title: Mosaicplot for the data in Shannonci and Simpsonci
### Aliases: mosaicdiv
### Keywords: hplot

### ** Examples


data(HCD)

HCDFam <- HCD[,-1]

SCI<-Simpsonci(X=HCDFam, f=HCD[,1])

mosaicdiv(SCI, decreasing=TRUE, col=rainbow(n=8))




