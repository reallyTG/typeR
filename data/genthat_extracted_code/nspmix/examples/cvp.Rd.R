library(nspmix)


### Name: cvps
### Title: Class 'cvps'
### Aliases: cvp rcvp cvps rcvps print.cvps
### Keywords: class function

### ** Examples


mix = disc(pt=c(0,4), pr=c(0.3,0.7))
x = rcvp(100, ni=3:10, mu=mix$pt, pr=mix$pr, sd=1)
cnmms(cvps(x))




