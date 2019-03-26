library(networkTomography)


### Name: calcN
### Title: Compute total traffic from a particular time.
### Aliases: calcN
### Keywords: algebra

### ** Examples

data(bell.labs)
A.decomp <- decomposeA(bell.labs$A)
total.traffic <- calcN(yt=bell.labs$Y[1,], A1=A.decomp$A1)
total.traffic == sum(bell.labs$X[1,])



