library(stheoreme)


### Name: utild1bin
### Title: Vector Binarizer
### Aliases: utild1bin

### ** Examples

s0<-rep(c(-1,1,3,7,10),2)
s1<-c(1:7)

s0; s1
a<-utild1bin(arr0=s0, arr1=s1); a
a<-utild1bin(s0, s1, method='spec', trsh=c(2,5), inverted=TRUE); a



