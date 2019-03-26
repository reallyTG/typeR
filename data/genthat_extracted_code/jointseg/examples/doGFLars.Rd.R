library(jointseg)


### Name: doGFLars
### Title: Group fused Lars segmentation
### Aliases: doGFLars

### ** Examples


p <- 2
trueK <- 10
sim <- randomProfile(1e4, trueK, 1, p)
Y <- sim$profile
K <- 2*trueK
res <- doGFLars(Y, K)
print(res$bkp)
print(sim$bkp)
plotSeg(Y, res$bkp)

## a toy example with missing values
sim <- randomProfile(1e2, 1, 0.1, 2)
Y <- sim$profile
Y[3:50, 2] <- NA

res <- doGFLars(Y, 10, 2, verbose=TRUE)
print(res$bkp)
print(sim$bkp)
plotSeg(Y, res$bkp)




