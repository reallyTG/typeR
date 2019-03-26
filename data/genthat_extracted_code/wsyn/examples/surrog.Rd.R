library(wsyn)


### Name: surrog
### Title: Creates surrogate time series, either Fourier surrogates or
###   amplitude adjusted Fourier surrogates
### Aliases: surrog

### ** Examples

times<-1:100
dat<-sin(2*pi*times/10)
nsurrogs<-10
surrtype<-"fft"
syncpres<-TRUE
res<-surrog(dat,nsurrogs,surrtype,syncpres)




