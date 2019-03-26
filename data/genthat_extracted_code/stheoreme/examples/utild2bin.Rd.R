library(stheoreme)


### Name: utild2bin
### Title: Matrix Binarizer
### Aliases: utild2bin

### ** Examples

s0<-array(c(-1,1,3,7,10),c(2,5))
s1<-array(c(1:7), c(7,2))

s0; s1
a<-utild2bin(d2arr0=s0, d2arr1=s1); a
a<-utild2bin(s0, s1, method='isubsd', inverted=TRUE); a
a<-utild2bin(s0, s1, method='spec', trsh=c(-1,2)); a



