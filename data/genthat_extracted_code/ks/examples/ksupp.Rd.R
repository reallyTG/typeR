library(ks)


### Name: ksupp
### Title: Kernel support estimate
### Aliases: ksupp
### Keywords: smooth

### ** Examples

library(oz)
data(grevillea)
fhat <- kde(x=grevillea)
fhat.supp <- ksupp(fhat, convex.hull=TRUE)
plot(fhat, display="filled.contour", cont=seq(10,90,by=10), drawlabels=FALSE)
plot(fhat, cont=95, add=TRUE)
polygon(fhat.supp, lty=2)



