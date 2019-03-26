library(BsMD)


### Name: summary.MD
### Title: Summary of Best MD Follow-Up Experiments
### Aliases: summary.MD
### Keywords: design

### ** Examples

### Reactor Experiment. Meyer et al. 1996, example 3.
library(BsMD)
data(Reactor.data,package="BsMD")

# Posterior probabilities based on first 8 runs
X <- as.matrix(cbind(blk = rep(-1,8), Reactor.data[c(25,2,19,12,13,22,7,32), 1:5]))
y <- Reactor.data[c(25,2,19,12,13,22,7,32), 6]
reactor.BsProb <- BsProb(X = X, y = y, blk = 1, mFac = 5, mInt = 3,
        p =0.25, g =0.40, ng = 1, nMod = 32)

# MD optimal 4-run design
p <- reactor.BsProb$ptop
s2 <- reactor.BsProb$sigtop
nf <- reactor.BsProb$nftop
facs <- reactor.BsProb$jtop
nFDes <- 4
Xcand <- as.matrix(cbind(blk = rep(+1,32), Reactor.data[,1:5]))
reactor.MD <- MD(X = X, y = y, nFac = 5, nBlk = 1, mInt = 3, g =0.40, nMod = 32,
        p = p,s2 = s2, nf = nf, facs = facs, nFDes = 4, Xcand = Xcand,
        mIter = 20, nStart = 25, top = 5)
print(reactor.MD)
summary(reactor.MD)



