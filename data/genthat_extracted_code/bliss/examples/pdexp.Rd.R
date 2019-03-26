library(bliss)


### Name: pdexp
### Title: pdexp
### Aliases: pdexp

### ** Examples

pdexp(10,seq(0,1,1))

x <- seq(0,10,le=1e3)
plot(x,dexp(x,0.5),lty=2,type="l")
lines(pdexp(0.5,1:10),type="p")



