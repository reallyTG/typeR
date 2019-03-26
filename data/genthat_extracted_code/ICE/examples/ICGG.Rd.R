library(ICE)


### Name: ICGG
### Title: Gentleman and Geyer's Data
### Aliases: ICGG
### Keywords: datasets

### ** Examples

 library(KernSmooth)
 tmp <- apply(ICGG, 1, mean)  # tmp now contains the interval midpoints
 h <- dpik(tmp)               # direct-plug-in bandwidth selected for
                              # interval midpoints
 par(mfrow=c(1,2))
 estimate <- ickde(ICGG, h=h, m=200)
 plot(estimate, type="l", main="One fixed point")
 estimate <- ickde(ICGG, f=c(rep(1,60),rep(0,90),rep(1,60)), h=.1)
 plot(estimate, type="l", main="Another fixed point")



