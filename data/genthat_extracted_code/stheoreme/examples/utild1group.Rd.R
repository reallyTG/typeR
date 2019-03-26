library(stheoreme)


### Name: utild1group
### Title: Vector Framer
### Aliases: utild1group

### ** Examples

s0<-rep(c(-1,1,3,7,10),3)
s1<-c(1:14)

s0; s1
a<-utild1group(arr0=s0, arr1=s1); a
a<-utild1group(s0, s1, radius=2); a
a<-utild1group(s0, s1, radius=2, method='splitN'); a



