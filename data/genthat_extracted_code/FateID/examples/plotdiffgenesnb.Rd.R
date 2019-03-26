library(FateID)


### Name: plotdiffgenesnb
### Title: Function for plotting differentially expressed genes
### Aliases: plotdiffgenesnb

### ** Examples


x <- intestine$x
y <- intestine$y
v <- intestine$v

tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)

thr <- .3

A <- rownames(fb$probs)[fb$probs[,"t6"]  > .3]
B <- rownames(fb$probs)[fb$probs[,"t13"] > .3]
de <- diffexpnb(v,A=A,B=B)
plotdiffgenesnb(de,pthr=.05)




