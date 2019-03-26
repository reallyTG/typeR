library(seewave)


### Name: ffilter
### Title: Frequency filter
### Aliases: ffilter
### Keywords: ts filter

### ** Examples

a<-noisew(f=8000,d=1)
# low-pass
b<-ffilter(a,f=8000,to=1500)
spectro(b,f=8000,wl=512)
# high-pass
c<-ffilter(a,f=8000,from=2500)
spectro(c,f=8000,wl=512)
# band-pass
d<-ffilter(a,f=8000,from=1000,to=2000)
spectro(d,f=8000,wl=512)
# band-stop
e<-ffilter(a,f=8000,from=1500,to=2500,bandpass=FALSE)
spectro(e,f=8000,wl=512)
# custom
myfilter1<-rep(c(rep(0,64),rep(1,64)),4)
g<-ffilter(a,f=8000,custom=myfilter1)
spectro(g,f=8000)



