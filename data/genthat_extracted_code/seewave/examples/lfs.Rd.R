library(seewave)


### Name: lfs
### Title: Linear Frequency Shift
### Aliases: lfs
### Keywords: ts

### ** Examples

data(orni)
a<-lfs(orni,f=22050,shift=1000)
spectro(a,f=22050)
# to be compared with the original signal
spectro(orni,f=22050)



