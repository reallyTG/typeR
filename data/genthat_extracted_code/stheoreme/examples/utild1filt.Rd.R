library(stheoreme)


### Name: utild1filt
### Title: Gaussian Filter for Vectors
### Aliases: utild1filt

### ** Examples

s1<-sin(c(1:128)*2)+2-c(1:128)*4/128

a<-utild1filt(arr0=s1, arr1=s1)
plot(s1, type='l')
lines(a$filt1, col='red')

s0<-c(rep(0,15), rep(2,12), rep(-2,12), rep(0,25))
s1<-c(rep(0,45), rep(2,4), rep(-2,4), rep(0,25))

a<-utild1filt(s0, s1, outsize=7, strong=.5)
plot(s0, type='l', ylab='s0, s1, a$filt0, a$filt1')
lines(s1, col='gray')
lines(a$filt0, col='red')
lines(a$filt1, col='purple')




