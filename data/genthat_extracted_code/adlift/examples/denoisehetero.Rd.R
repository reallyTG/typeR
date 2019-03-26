library(adlift)


### Name: denoisehetero
### Title: denoisehetero
### Aliases: denoisehetero denoisehetero2
### Keywords: smooth regression

### ** Examples

x1<-runif(256)
y1<-make.signal2("doppler",x=x1)
n1<-rnorm(256,0,.1)
z1<-y1+n1
#
est1<-denoisehetero(x1,z1,AdaptNeigh,1,TRUE,TRUE,2)
traceback()
sum(abs(y1-est1))
#
#the error between the true signal and the denoised version. 





