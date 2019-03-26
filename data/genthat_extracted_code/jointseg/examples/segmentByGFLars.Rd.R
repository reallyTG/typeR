library(jointseg)


### Name: segmentByGFLars
### Title: Group fused Lars segmentation (low-level)
### Aliases: segmentByGFLars

### ** Examples


p <- 2
trueK <- 10
sim <- randomProfile(1e4, trueK, 1, p)
Y <- sim$profile
K <- 2*trueK
res <- segmentByGFLars(Y, K)
print(res$bkp)
print(sim$bkp)
plotSeg(Y, res$bkp)




