library(oce)


### Name: swN2
### Title: Squared buoyancy frequency for seawater
### Aliases: swN2

### ** Examples


library(oce)
data(ctd)
# Illustrate difference between UNESCO and GSW
p <- ctd[["pressure"]]
ylim <- rev(range(p))
par(mfrow=c(1,3), mar=c(3, 3, 1, 1), mgp=c(2, 0.7, 0))
plot(ctd[["sigmaTheta"]], p, ylim=ylim, type='l', xlab=expression(sigma[theta]))
N2u <- swN2(ctd, eos="unesco")
N2g <- swN2(ctd, eos="gsw")
plot(N2u, p, ylim=ylim, xlab="N2 Unesco", ylab="p", type="l")
d <- 100 * (N2u - N2g) / N2g
plot(d, p, ylim=ylim, xlab="N2 UNESCO-GSW diff. [%]", ylab="p", type="l")
abline(v=0)



