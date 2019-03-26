library(jointseg)


### Name: segmentByRBS
### Title: Recursive Binary Segmentation (low-level)
### Aliases: segmentByRBS

### ** Examples


p <- 2
trueK <- 10
len <- 1e4
sim <- randomProfile(len, trueK, 1, p)
Y <- sim$profile
K <- 2*trueK
res <- segmentByRBS(Y, K)
getTpFp(res$bkp, sim$bkp, tol=10, relax = -1)   ## true and false positives

cols <- rep(2, K)
cols[1:trueK] <- 3
par(mfrow=c(p,1))
for (ii in 1:p) {
    plot(Y[, ii], pch=19, cex=0.2)
    abline(v=res$bkp[1:trueK], col= cols)
    abline(v=sim$bkp, col=8, lty=2)
}

## NA:s in one dimension at a true breakpoint
jj <- sim$bkp[1]
Y[jj-seq(-10, 10), p] <- NA
res2 <- segmentByRBS(Y, K)
getTpFp(res2$bkp, sim$bkp, tol=10, relax = -1)   ## true and false positives

## NA:s in both dimensions at a true breakpoint
Y[jj-seq(-10, 10), ] <- NA
res3 <- segmentByRBS(Y, K)
getTpFp(res3$bkp, sim$bkp, tol=10, relax = -1)   ## true and false positives




