library(stheoreme)


### Name: utild2clean
### Title: Matrix Cleaner
### Aliases: utild2clean

### ** Examples

s0<-array(c(-1,1,3,7,10),c(2,5))
s1<-array(c(rep(c(1,2),7),20), c(5,3))

s0;s1
a<-utild2clean(d2arr0=s0, d2arr1=s1); a
a<-utild2clean(s0, s1, method='left', nsigma=0.3); a



