library(adlift)


### Name: denoiseheteroprop
### Title: denoiseheteroprop
### Aliases: denoiseheteroprop denoiseheteroprop2
### Keywords: smooth regression

### ** Examples

x1<-runif(256)
y1<-make.signal2("doppler",x=x1)
n1<-rnorm(256,0,.1)
z1<-y1+n1
gvec<-c(rep(.4,times=100),rep(.7,times=100),rep(.3,times=56))
#
est1<-denoiseheteroprop(x1,z1,AdaptNeigh,1,TRUE,TRUE,2,"median",gvec)
sum(abs(y1-est1))
#
#the error between the true signal and the denoised version. 





