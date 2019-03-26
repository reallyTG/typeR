library(jointseg)


### Name: jointSeg
### Title: Joint segmentation of multivariate signals
### Aliases: jointSeg

### ** Examples

## A two-dimensional signal
p <- 2
trueK <- 10
len <- 1e4
sim <- randomProfile(len, trueK, 1, p)
Y <- sim$profile
K <- 2*trueK
res <- jointSeg(Y, method="RBS", K=K)
bkp <- res$bestBkp
getTpFp(bkp, sim$bkp, tol=5, relax = -1)   ## true and false positives
plotSeg(Y, list(sim$bkp, res$bestBkp), col=1)

## Now we add some NA:s in one dimension
jj <- sim$bkp[1]
Y[jj-seq(-10,10), p] <- NA
res2 <- jointSeg(Y, method="RBS", K=K, verbose=TRUE)
bkp <- res2$bestBkp
getTpFp(res2$bestBkp, sim$bkp, tol=5, relax = -1)   ## true and false positives



