library(stheoreme)


### Name: utild2filt
### Title: Gaussian Filter for Matrices
### Aliases: utild2filt

### ** Examples

s0<-array(c(1,4,5,8,3), c(6,6))
s1<-array(c(1,1,1,1,1,8,1,1,1,1,1,1), c(5,6))

s0; s1
utild2filt(d2arr0=s0, d2arr1=s1)
utild2filt(s0, s1, outsize=1)
utild2filt(s0, s1, strong=.2)



