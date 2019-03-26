library(BsMD)


### Name: MD
### Title: Best Model Discrimination (MD) Follow-Up Experiments
### Aliases: MD
### Keywords: design

### ** Examples

### Injection Molding Experiment. Meyer et al. 1996, example 2.
library(BsMD)
data(BM93.e3.data,package="BsMD")
X <- as.matrix(BM93.e3.data[1:16,c(1,2,4,6,9)])
y <- BM93.e3.data[1:16,10]
p <- c(0.2356,0.2356,0.2356,0.2356,0.0566)
s2 <- c(0.5815,0.5815,0.5815,0.5815,0.4412)
nf <- c(3,3,3,3,4)
facs <- matrix(c(2,1,1,1,1,3,3,2,2,2,4,4,3,4,3,0,0,0,0,4),nrow=5,
    dimnames=list(1:5,c("f1","f2","f3","f4")))
nFDes <- 4
Xcand <- matrix(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                    -1,-1,-1,-1,1,1,1,1,-1,-1,-1,-1,1,1,1,1,
                    -1,-1,1,1,-1,-1,1,1,-1,-1,1,1,-1,-1,1,1,
                    -1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,
                    -1,1,1,-1,1,-1,-1,1,1,-1,-1,1,-1,1,1,-1),
                    nrow=16,dimnames=list(1:16,c("blk","f1","f2","f3","f4"))
                )
injectionMolding.MD <- MD(X = X, y = y, nFac = 4, nBlk = 1, mInt = 3,
            g = 2, nMod = 5, p = p, s2 = s2, nf = nf, facs = facs,
            nFDes = 4, Xcand = Xcand, mIter = 20, nStart = 25, top = 10)
summary(injectionMolding.MD)



### Reactor Experiment. Meyer et al. 1996, example 3.
par(mfrow=c(1,2),pty="s")
data(Reactor.data,package="BsMD")

# Posterior probabilities based on first 8 runs
X <- as.matrix(cbind(blk = rep(-1,8), Reactor.data[c(25,2,19,12,13,22,7,32), 1:5]))
y <- Reactor.data[c(25,2,19,12,13,22,7,32), 6]
reactor8.BsProb <- BsProb(X = X, y = y, blk = 1, mFac = 5, mInt = 3,
        p =0.25, g =0.40, ng = 1, nMod = 32)
plot(reactor8.BsProb,prt=TRUE,,main="(8 runs)")

# MD optimal 4-run design
p <- reactor8.BsProb$ptop
s2 <- reactor8.BsProb$sigtop
nf <- reactor8.BsProb$nftop
facs <- reactor8.BsProb$jtop
nFDes <- 4
Xcand <- as.matrix(cbind(blk = rep(+1,32), Reactor.data[,1:5]))
reactor.MD <- MD(X = X, y = y, nFac = 5, nBlk = 1, mInt = 3, g =0.40, nMod = 32,
        p = p,s2 = s2, nf = nf, facs = facs, nFDes = 4, Xcand = Xcand,
        mIter = 20, nStart = 25, top = 5)
summary(reactor.MD)

# Posterior probabilities based on all 12 runs
X <- rbind(X, Xcand[c(4,10,11,26), ])
y <- c(y, Reactor.data[c(4,10,11,26),6])
reactor12.BsProb <- BsProb(X = X, y = y, blk = 1, mFac = 5, mInt = 3,
        p = 0.25, g =1.20,ng = 1, nMod = 5)
plot(reactor12.BsProb,prt=TRUE,main="(12 runs)")



