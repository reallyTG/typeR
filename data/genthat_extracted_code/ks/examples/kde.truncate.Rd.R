library(ks)


### Name: kde.truncate
### Title: Truncated kernel density derivative estimate
### Aliases: kde.truncate kdde.truncate
### Keywords: smooth

### ** Examples

library(oz)
data(grevillea)
wa.coast <- ozRegion(section=1)
wa.polygon <- cbind(wa.coast$lines[[1]]$x, wa.coast$lines[[1]]$y)
fhat <- kde(x=grevillea)
fhat <- kde.truncate(fhat, wa.polygon)
oz(section=1, xlim=c(114.75, 121.5),  ylim=c(-33, -31.5))
plot(fhat, add=TRUE, cont=seq(10,90,by=10), col=2, drawlabels=FALSE, drawpoints=TRUE)



