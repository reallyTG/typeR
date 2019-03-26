library(BsMD)


### Name: print.MD
### Title: Print Best MD Follow-Up Experiments
### Aliases: print.MD
### Keywords: design

### ** Examples

# Injection Molding Experiment. Meyer et al. 1996. Example 2.
# MD for one extra experiment.
library(BsMD)
data(BM93.e3.data,package="BsMD")
X <- as.matrix(BM93.e3.data[1:16,c(1,2,4,6,9)])
y <- BM93.e3.data[1:16,10]
nBlk <- 1
nFac <- 4
mInt <- 3
g <- 2
nMod <- 5
p <- c(0.2356,0.2356,0.2356,0.2356,0.0566)
s2 <- c(0.5815,0.5815,0.5815,0.5815,0.4412)
nf <- c(3,3,3,3,4)
facs <- matrix(c(2,1,1,1,1,3,3,2,2,2,4,4,3,4,3,0,0,0,0,4),nrow=5,
    dimnames=list(1:5,c("f1","f2","f3","f4")))
nFDes <- 1
Xcand <- matrix(c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
                    -1,-1,-1,-1,1,1,1,1,-1,-1,-1,-1,1,1,1,1,
                    -1,-1,1,1,-1,-1,1,1,-1,-1,1,1,-1,-1,1,1,
                    -1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,-1,1,
                    -1,1,1,-1,1,-1,-1,1,1,-1,-1,1,-1,1,1,-1),
                    nrow=16,dimnames=list(1:16,c("blk","f1","f2","f3","f4"))
                )
mIter <- 0
startDes <- matrix(c(9,11,12,15),nrow=4)
top <- 10
injectionMolding.MD <- MD(X=X,y=y,nFac=nFac,nBlk=nBlk,mInt=mInt,g=g,
            nMod=nMod,p=p,s2=s2,nf=nf,facs=facs,
            nFDes=nFDes,Xcand=Xcand,mIter=mIter,startDes=startDes,top=top)

print(injectionMolding.MD)
summary(injectionMolding.MD)




