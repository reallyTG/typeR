library(FateID)


### Name: dptTraj
### Title: Inferenence of diffusion pseudotime (DPT) for all cells on a
###   differentiation trajectory
### Aliases: dptTraj

### ** Examples


## No test: 
x <- intestine$x
y <- intestine$y
tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
dr <- compdr(x,z=NULL,m="cmd",k=2,lle.n=30,dm.sigma=1000,dm.distance="euclidean",tsne.perplexity=30)
trc <- dptTraj(x,y,fb,trthr=.25,distance="euclidean",sigma=1000)
## End(No test)



