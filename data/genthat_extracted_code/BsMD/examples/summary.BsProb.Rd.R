library(BsMD)


### Name: summary.BsProb
### Title: Summary of Posterior Probabilities from Bayesian Screening
### Aliases: summary.BsProb
### Keywords: design

### ** Examples

library(BsMD)
data(BM86.data,package="BsMD")
X <- as.matrix(BM86.data[,1:15])
y <- BM86.data["y1"]
# Using prior probability of p = 0.20, and k = 10 (gamma = 2.49)
drillAdvance.BsProb <- BsProb(X = X, y = y, blk = 0, mFac = 15, mInt = 1,
            p = 0.20, g = 2.49, ng = 1, nMod = 10)
plot(drillAdvance.BsProb)
summary(drillAdvance.BsProb)

# Using prior probability of p = 0.20, and a 5 <= k <= 15 (1.22 <= gamma <= 3.74)
drillAdvance.BsProbG <- BsProb(X = X, y = y, blk = 0, mFac = 15, mInt = 1,
            p = 0.25, g = c(1.22, 3.74), ng = 3, nMod = 10)
plot(drillAdvance.BsProbG)
summary(drillAdvance.BsProbG)



