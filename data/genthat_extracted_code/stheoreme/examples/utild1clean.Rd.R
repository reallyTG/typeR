library(stheoreme)


### Name: utild1clean
### Title: Vector Cleaner
### Aliases: utild1clean

### ** Examples


s0<-c(rep(c(1,3,7,10),3), -23)
s1<-c(1:7)

s0; s1
a<-utild1clean(arr0=s0, arr1=s1); a
a<-utild1clean(s0, s1, method='right', nsigma=0.8); a



