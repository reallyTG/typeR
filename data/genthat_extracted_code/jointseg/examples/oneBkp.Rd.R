library(jointseg)


### Name: oneBkp
### Title: Get best candidate change point
### Aliases: oneBkp
### Keywords: internal

### ** Examples


p <- 2
sim <- randomProfile(1e4, 1, 1, p)
Y <- sim$profile
bkp <- jointseg:::oneBkp(Y)
par(mfrow=c(p,1))
for (ii in 1:p) {
    plot(Y[, ii], pch=19, cex=0.2)
    abline(v=bkp, col=3)
    abline(v=sim$bkp, col=8, lty=2)
}




