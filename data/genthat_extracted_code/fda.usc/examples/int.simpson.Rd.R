library(fda.usc)


### Name: int.simpson
### Title: Simpson integration
### Aliases: int.simpson
### Keywords: cluster

### ** Examples

x<-seq(0,2*pi,length=1001)
fx<-fdata(sin(x)/sqrt(pi),x)
fx0<-fdata(rep(0,length(x)),x)
int.simpson(fx0)
int.simpson(fx)



