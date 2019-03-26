library(binhf)


### Name: invbinhf.wd
### Title: Inverse Haar-NN transform
### Aliases: invbinhf.wd
### Keywords: manip

### ** Examples

x<-rbinom(256,32,.35)

y<-binhf.wd(x,32)

x1<-invbinhf.wd(y,32)



