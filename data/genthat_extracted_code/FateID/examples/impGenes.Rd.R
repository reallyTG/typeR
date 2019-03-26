library(FateID)


### Name: impGenes
### Title: Extract genes with high importance values for random forest
###   classification
### Aliases: impGenes

### ** Examples

x <- intestine$x
y <- intestine$y
tar <- c(6,9,13)
fb <- fateBias(x,y,tar,z=NULL,minnr=5,minnrh=10,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL)
k <- impGenes(fb,"t6",ithr=.02,zthr=2)



