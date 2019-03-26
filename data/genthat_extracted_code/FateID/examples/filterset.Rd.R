library(FateID)


### Name: filterset
### Title: Function filtering expression data
### Aliases: filterset

### ** Examples

## No test: 
x <- intestine$x
y <- intestine$y
v <- intestine$v

tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
trc <- dptTraj(x,y,fb,trthr=.25,distance="euclidean",sigma=1000)
n <- trc[["t6"]]
fs  <- filterset(v,n,minexpr=2,minnumber=1)
## End(No test)



