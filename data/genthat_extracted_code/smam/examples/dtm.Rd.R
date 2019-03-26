library(smam)


### Name: dtm
### Title: Density for Time Spent in Moving or Resting
### Aliases: dtm dtr

### ** Examples

lamM <- 1
lamR <- c(1/2, 1, 2)
lr <- length(lamR)
totalT <- 10
old.par <- par(no.readonly=TRUE)
par(mfrow=c(1, 2), mar=c(2.5, 2.5, 1.1, 0.1), mgp=c(1.5, 0.5, 0), las=1)
curve(dtm(x, totalT, 1, 1/2, "m"), 0, totalT, lty=1, ylim=c(0, 0.34),
      xlab="M(10)", ylab="density")
curve(dtm(x, totalT, 1, 1, "m"), 0, totalT, lty=2, add=TRUE)
curve(dtm(x, totalT, 1, 2, "m"), 0, totalT, lty=3, add=TRUE)
mtext(expression("S(0) = 1"))
legend("topleft", legend = expression(lambda[r] == 1/2, lambda[r] == 1,
       lambda[r] == 2), lty = 1:lr)
curve(dtm(x, totalT, 1, 1/2, "r"), 0, totalT, lty=1, ylim=c(0, 0.34),
      xlab="M(10)", ylab="density")
curve(dtm(x, totalT, 1, 1, "r"), 0, totalT, lty=2, add=TRUE)
curve(dtm(x, totalT, 1, 2, "r"), 0, totalT, lty=3, add=TRUE)
mtext(expression("S(0) = 0"))
legend("topleft", legend = expression(lambda[r] == 1/2, lambda[r] == 1,
      lambda[r] == 2), lty = 1:lr)
par(old.par)




