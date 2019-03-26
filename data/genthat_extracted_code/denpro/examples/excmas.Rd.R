library(denpro)


### Name: excmas
### Title: Computes the excess masses associated with the nodes of a level
###   set tree
### Aliases: excmas
### Keywords: multivariate smooth

### ** Examples

set.seed(1)
dendat<-matrix(rnorm(20),10)   #10*2 data-matrix
pcf<-pcf.kern(dendat,h=1,N=c(16,16))
lst<-leafsfirst(pcf)
excmas(lst)




