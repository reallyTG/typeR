library(FateID)


### Name: prcurve
### Title: Computation of a principal curve for a given dimensional
###   reduction representation
### Aliases: prcurve

### ** Examples


x <- intestine$x
y <- intestine$y
tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
dr <- compdr(x,z=NULL,m="cmd",k=2,lle.n=30,dm.sigma=1000,dm.distance="euclidean",tsne.perplexity=30)
pr <- prcurve(y,fb,dr,k=2,m="cmd",trthr=0.25,start=NULL)




