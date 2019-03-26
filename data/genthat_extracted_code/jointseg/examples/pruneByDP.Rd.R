library(jointseg)


### Name: pruneByDP
### Title: Exact segmentation of a multivariate signal using dynamic
###   programming.
### Aliases: pruneByDP

### ** Examples


p <- 2
trueK <- 10
sim <- randomProfile(1e4, trueK, 1, p)
Y <- sim$profile
K <- 2*trueK
res <- segmentByRBS(Y, K)
resP <- pruneByDP(Y, res$bkp)

##   Note that all of the above can be dmethod=="other"one directly using 'jointSeg'
resJ <- jointSeg(sim$profile, method="RBS", K=K)
stopifnot(identical(resP$bkpList, resJ$dpBkp))

## check consistency when no NA
resP2 <- pruneByDP(Y, res$bkp, allowNA=FALSE)
max(abs(resP$rse-resP2$rse))

plotSeg(Y, list(resP$bkp[[trueK]], sim$bkp), col=1)




