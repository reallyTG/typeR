library(FateID)


### Name: reclassify
### Title: Reclassification of cells
### Aliases: reclassify

### ** Examples

x <- intestine$x
y <- intestine$y
tar <- c(6,9,13)
rc <- reclassify(x,y,tar,z=NULL,nbfactor=5,use.dist=FALSE,seed=NULL,nbtree=NULL,q=.9)



