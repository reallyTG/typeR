library(denpro)


### Name: modecent
### Title: Returns locations of modes of a density estimate
### Aliases: modecent
### Keywords: multivariate

### ** Examples

set.seed(1)
dendat<-matrix(rnorm(20),10)   #10*2 data-matrix
pcf<-pcf.kern(dendat,h=2,N=c(16,16))
lst<-leafsfirst(pcf)
modecent(lst)




