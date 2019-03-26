library(spc)


### Name: xcusum.crit.L0h
### Title: Compute the CUSUM reference value k for given in-control ARL and
###   threshold h
### Aliases: xcusum.crit.L0h
### Keywords: ts

### ** Examples

L0 <- 100
h.max <- xcusum.crit(0, L0, 0)
hs <- (300:1)/100
hs <- hs[hs < h.max]
ks <- NULL
for ( h in hs ) ks <- c(ks, xcusum.crit.L0h(L0, h))  
k.max <- qnorm( 1 - 1/L0 )
plot(hs, ks, type="l", ylim=c(0, max(k.max, ks)), xlab="h", ylab="k")
abline(h=c(0, k.max), col="red")



