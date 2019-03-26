library(denpro)


### Name: locofmax
### Title: Calculates the location of the maximum of a function
### Aliases: locofmax
### Keywords: multivariate

### ** Examples

dendat<-sim.data(n=100,type="mulmod")
pcf<-pcf.kern(dendat,h=1,N=c(32,32))

locofmax(pcf)




