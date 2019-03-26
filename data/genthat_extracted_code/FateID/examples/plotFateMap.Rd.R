library(FateID)


### Name: plotFateMap
### Title: Plot dimensional reduction representation of the expression data
### Aliases: plotFateMap

### ** Examples


x <- intestine$x
y <- intestine$y
# v contains all genes (no feature selection like in x)
v <- intestine$v
fcol <- intestine$fcol
tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
dr <- compdr(x,z=NULL,m="cmd",k=2,lle.n=30,dm.sigma=1000,dm.distance="euclidean",tsne.perplexity=30)

# plot principal curves
pr <- plotFateMap(y,dr,k=2,prc=TRUE,m="cmd",col=fcol,fb=fb,trthr=0.25,start=NULL,tp=.5)

# plot expression of gene Apoa1__chr9
plotFateMap(y,dr,x=v,g="Apoa1__chr9",prc=FALSE,k=2,m="cmd",col=intestine$fcol)




