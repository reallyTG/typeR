library(FateID)


### Name: getsom
### Title: Topological ordering of pseudo-temporal expression profiles
### Aliases: getsom

### ** Examples


## No test: 
x <- intestine$x
y <- intestine$y
v <- intestine$v

tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
dr <- compdr(x,z=NULL,m="cmd",k=2,lle.n=30,dm.sigma=1000,dm.distance="euclidean",tsne.perplexity=30)
pr <- prcurve(y,fb,dr,k=2,m="cmd",trthr=0.4,start=NULL)
n <- pr$trc[["t6"]]
fs  <- filterset(v,n,minexpr=2,minnumber=1)
s1d <- getsom(fs,nb=1000,alpha=.5)
## End(No test)




