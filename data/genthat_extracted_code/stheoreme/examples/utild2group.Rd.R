library(stheoreme)


### Name: utild2group
### Title: Matrix Framer
### Aliases: utild2group

### ** Examples

s0<-array(c(-1,1,3,7,10),c(14,12))
s1<-array(c(1:156),c(12,13))

s0; s1
a<-utild2group(d2arr0=s0, d2arr1=s1); a
a<-utild2group(s0, s1, radius=2, method='splitN'); a
a<-utild2group(s0, s1, radius=3); a



